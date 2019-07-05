class CreateCarriers < ActiveRecord::Migration[5.2]
  def up
    create_table :carriers do |t|
      t.string :name
      t.integer :age
      t.boolean :has_driver_licence_a
      t.boolean :has_driver_licence_b
      t.boolean :has_driver_licence_c

      t.timestamps
    end
  end

  def down
    drop_table :carriers
  end
end
