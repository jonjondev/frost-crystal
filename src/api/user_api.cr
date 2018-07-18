# class ExampleApi < BaseApi
#   extend Routable

#   @@namespace = "/users"

#   # Routes

#   # index
#   get route("/") do
#     load_users
#     @users.to_json
#   end

#   # show
#   get route("/:id") do
#     load_user
#     @user.to_json
#   end

#   # create
#   post route("/") do
#     new_user
#     build_user
#     save_user
#   end

#   # update
#   put route("/:id") do
#     load_user
#     build_user
#     save_user
#   end

#   # destroy
#   delete route("/:id") do
#     load_user
#     @user.destroy
#   end

#   # Private Methods

#   private def new_user
#     @user = User.new
#   end

#   private def self.load_users
#     @users = [User.new, User.new]
#     # @users = User.all
#   end

#   private def load_user
#     @user = User.get(params[:id])
#   end

#   private def build_user
#     @user.attributes = user_params
#   end

#   private def save_user
#     @user.to_json if @user.save
#   end

#   private def user_params
#     {first_name:    params[:first_name] || @user.first_name,
#      last_name:     params[:last_name] || @user.last_name,
#      email:         params[:email] || @user.email,
#      password_hash: params[:password] || @user.password_hash}
#   end
# end
