class User < ApplicationRecord
  include Filterable

  has_secure_token
  has_secure_password
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true
end
