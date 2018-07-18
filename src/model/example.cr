class Example < Topaz::Model
  extend Frost::OrmWrapper

  columns(
    name: String,
    description: String
  )
end
