class CreateKitComponents < ActiveRecord::Migration
  def change
    create_table :kit_components do |t|
      t.integer :parts_kit_id
      t.integer :part_id
      t.integer :part_quantity
    
      t.timestamps
    end
  end
end
