class Signup
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :user
  attr_reader :card
  attr_reader :address


end
