class Example < Granite::Base
  adapter pg

  # Fields
  timestamps
  primary id : Int64
  field name : String
  field body : String

  # Object methods
end
