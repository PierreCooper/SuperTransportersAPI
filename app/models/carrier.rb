class Carrier < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :age, presence: true
  validates :has_driver_licence_a, inclusion: {in: [true, false]}
  validates :has_driver_licence_b, inclusion: {in: [true, false]}
  validates :has_driver_licence_c, inclusion: {in: [true, false]}
  validate :is_carrier_adult
  validate :has_one_valid_licence

  has_many :transporter_carriers
  has_many :transporters, through: :transporter_carriers

  has_many :trackings, dependent: :destroy

  def has_one_valid_licence
    if !has_driver_licence_a && !has_driver_licence_b && !has_driver_licence_c
      errors.add(:has_driver_licence_a, "Carrier must have at least one driver licence")
    end
  end

  def is_carrier_adult
    if age.present? && age < 18
      errors.add(:age, "Carrier must be over 18")
    end
  end
end
