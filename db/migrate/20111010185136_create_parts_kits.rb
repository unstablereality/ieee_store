class CreatePartsKits < ActiveRecord::Migration
  def change
    create_table :parts_kits do |t|
      t.string :name
      t.integer :kit_price
      t.boolean :deprecated, :default => false
      
      t.timestamps
    end
  end
end
