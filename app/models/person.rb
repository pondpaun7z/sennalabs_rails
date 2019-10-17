class Person < ApplicationRecord
  has_many :cars
  validates :first_name, :last_name, presence: true
end
