class Example < Granite::Base
  adapter pg

  # Relationships
  belongs_to :user

  # Fields
  timestamps
  primary id : Int64
  field name : String
  field description : String

  # Object methods
end
