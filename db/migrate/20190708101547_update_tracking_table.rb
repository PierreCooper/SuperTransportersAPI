class UpdateTrackingTable < ActiveRecord::Migration[5.2]
  def change
    change_column :trackings, :altitude, :float
    remove_column :trackings, :float
  end
end
