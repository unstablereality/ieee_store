class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.string :jameco_pn
      t.integer :quantity
      t.integer :nominal_quantity
      t.integer :single_cost, :default => 0
      t.integer :lot_cost, :default => 0
      t.integer :lot_size
      t.integer :student_price, :default => 0
      t.boolean :deprecated, :default => false
      
      t.timestamps
    end
  end
end
