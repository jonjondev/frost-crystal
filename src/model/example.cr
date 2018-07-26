class Example < Granite::Base
  adapter pg

  # Fields
  timestamps
  primary id : Int64
  field name : String
  field description : String

  # Object methods
end
