class User < Granite::Base
  adapter pg

  # Relationships
  has_many :examples

  # Fields
  timestamps
  primary id : Int64
  field first_name : String
  field last_name : String
  field email : String
  field password_hash : String

  # Object methods
  def full_name
    "#{first_name} #{last_name}"
  end
end
