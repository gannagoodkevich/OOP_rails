require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_one :card
  has_one :address

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def confirm!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    save!
  end
end
