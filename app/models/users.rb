class Users < ActiveRecord::Base
  include BCrypt

  def password
    password ||= Password.new(password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end

  def authenticate(secret)
    self.password == secret
  end
  # Remember to create a migration!
end
