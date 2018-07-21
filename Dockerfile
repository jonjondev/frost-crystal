# Start generating the build image
FROM crystallang/crystal:0.25.1

# Install the dependencies
ADD shard.yml .
ADD shard.lock .
RUN shards install

# Add app and build it for production
ADD . .
RUN crystal build src/frost-crystal.cr --release

# Create a new image
FROM crystallang/crystal:0.25.1

# Copy over the executable, it's .dwarf and the database config
COPY --from=0 frost-crystal .
COPY --from=0 config/database.yml ./config/

EXPOSE 3000

# Run it!
CMD "./frost-crystal"