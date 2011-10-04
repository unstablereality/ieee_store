class CreateParts < ActiveRecord::Migration
  def up
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.string :jameco_pn
      t.integer :quantity
      t.integer :nominal_quantity
      t.decimal :single_cost
      t.decimal :lot_cost
      t.integer :lot_size
      t.decimal :student_price      
    end
  end

  def down
    drop_table :parts
  end
end
