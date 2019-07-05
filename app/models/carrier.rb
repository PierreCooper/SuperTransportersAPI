class Carrier < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :age, presence: true
  validates :has_driver_licence_a, presence: true
  validates :has_driver_licence_b, presence: true
  validates :has_driver_licence_c, presence: true
  validate :is_carrier_adult

  has_many :transporter_carriers
  has_many :transporters, through: :transporter_carriers

  def is_carrier_adult
    if age.present? && age < 18
      errors.add(:age, "Carrier must be over 18")
    end
  end
end
