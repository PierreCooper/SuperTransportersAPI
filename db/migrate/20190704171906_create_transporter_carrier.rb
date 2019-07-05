class CreateTransporterCarrier < ActiveRecord::Migration[5.2]
  def up
    create_table :transporter_carriers do |t|
      t.belongs_to :transporter, index: true
      t.belongs_to :carrier, index: true
      t.timestamps
    end
  end

  def down
    drop_table :transporter_carriers
  end
end
