require "crypto/bcrypt/password"

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

  def password=(new_password)
    if password = new_password
      self.password_hash = Crypto::Bcrypt::Password.create(password).to_s
    end
  end

  def password
    if hash = self.password_hash
      Crypto::Bcrypt::Password.new(hash)
    end
  end
end
