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
  field role : Int32

  # Callbacks
  before_save :set_default_role

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

  def admin?
    self.role >= Role::Admin.to_i
  end

  private def set_default_role
    self.role = Role::StandardUser.to_i unless self.role
  end

  enum Role
    StandardUser
    Admin
    SuperAdmin
  end
end
