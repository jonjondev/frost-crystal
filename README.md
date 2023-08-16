<p align="center">
  <img src="https://i.imgur.com/74RCHjv.png" width="65%">
</p>

# Frost Crystal: The coolest Crystal API framework

Frost Crystal is a **barebones, modular API framework** built with [Crystal](https://crystal-lang.org)... and it's super cool.

Its structure has been built out to be naturally quite opinionated. That being said however, the project's logic is easy enough to follow and **can easily be modified to suit your needs** as much of the logic can be found and modified in the helper files.

The project utilizes [Toro](https://github.com/soveran/toro) for modular routing and [Granite](https://github.com/amberframework/granite) for substrate-independent persistence.

## Getting Started

Start by downloading this repository, note that you must have already have [Crystal](https://crystal-lang.org) installed to use it.

Download dependencies with:

```bash
$ shards install
```

To get the project running at `localhost:3000` run:

```bash
$ crystal src/frost-crystal.cr
```

And you can test the project with:

```bash
$ crystal spec
```

## Examples

TODO: Write usage instructions here

## Project Structure

```
[root]
     |-[config] <- Configuration files for the application database
     |
     |-[spec]
     |      |-[api] <- Version-grouped test files suffixed with "_spec.cr"
     |
     |-[src]
     |     |-[api] <- Version-grouped API controller route files suffixed with "_api.cr"
     |     |
     |     |-[helpers] <- Helper files suffixed with "_helper.cr"
     |     |
     |     |-[models] <- Model files
     |
     |-(Dockerfile) <- A dockerfile that can generate a runnable container for prod
     |
     |-(shard.yml) <- The Crystal-lang dependency list
```

## Contributing

1. Fork it from [here](https://github.com/jonjondev/frost-crystal/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jonjondev](https://github.com/jonjondev) Jonathan Moallem - creator, maintainer

## License

This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
