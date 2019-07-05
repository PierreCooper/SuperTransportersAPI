class CreateTrackings < ActiveRecord::Migration[5.2]
  def up
    create_table :trackings do |t|
      t.float :latitude
      t.float :longitude
      t.string :altitude
      t.string :float

      t.timestamps
    end
  end

  def down
    drop_table :trackings
  end
end
