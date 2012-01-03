class CreatePartsKits < ActiveRecord::Migration
  def change
    create_table :parts_kits do |t|
      t.string :name
      t.integer :kit_price
      
      t.timestamps
    end
  end
end
