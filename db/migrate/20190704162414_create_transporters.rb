class CreateTransporters < ActiveRecord::Migration[5.2]
  def up
    create_table :transporters do |t|
      t.string :name
      t.string :siret
      t.string :postal_codes, array: true, default: [].to_yaml

      t.timestamps
    end
  end

  def down
    drop_table :transporters
  end
end
