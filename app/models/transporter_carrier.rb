class TransporterCarrier < ApplicationRecord
  belongs_to :transporter
  belongs_to :carrier
end
