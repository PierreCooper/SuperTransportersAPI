class Transporter < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :siret, presence: true, uniqueness: true
  validates :postal_codes, presence: true, allow_blank: false

  has_many :transporter_carriers
  has_many :carriers, through: :transporter_carriers
  accepts_nested_attributes_for :carriers
  validates_presence_of :carriers
end
