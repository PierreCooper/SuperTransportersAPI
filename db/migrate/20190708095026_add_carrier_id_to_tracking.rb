class AddCarrierIdToTracking < ActiveRecord::Migration[5.2]
  def up
    add_column :trackings, :carrier_id, :integer
  end

  def down
    remove_column :trackings, :carrier_id
  end
end
