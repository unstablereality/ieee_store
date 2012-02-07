class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.string :jameco_pn
      t.integer :quantity
      t.integer :nominal_quantity
      t.integer :single_cost
      t.integer :lot_cost
      t.integer :lot_size
      t.integer :student_price
      t.boolean :deprecated, :default => false
      t.boolean :sale_completed, :default => false
      
      t.timestamps
    end
  end
end
