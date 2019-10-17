class Person < ApplicationRecord
  has_many :cars
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def as_json(options = {})
    if options['report']
      {
        name: name,
        number_of_car: cars.count,
        cars: cars
      }
    else
      super
    end
  end
end
