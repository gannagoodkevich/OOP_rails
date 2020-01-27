class Signup
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :user
  attr_reader :card
  attr_reader :address

  attribute :email, String
  attribute :password, String

  attribute :country, String
  attribute :city, String
  attribute :street, String
  attribute :house_number, String
  attribute :apartment_number, String

  attribute :card_number, String
  attribute :name, String
  attribute :account_BYN, String

  validates :email, presence: true

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    @user = User.create!(email: email, password: password)
    @address = @user.create_address!(country: country, city: city, street: street, house_number: house_number, apartment_number: apartment_number)
    @card = @user.create_card!(card_number: card_number, name: name, account_BYN: account_BYN)
  end
end
