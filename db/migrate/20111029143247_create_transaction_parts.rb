class CreateTransactionParts < ActiveRecord::Migration
  def change
    create_table :transaction_parts do |t|
      t.integer :transaction_id
      t.integer :part_id
      t.integer :parts_kit_id
      t.integer :part_quantity
      t.integer :current_price
    
      t.timestamps
    end
    
    add_index :transaction_parts, [:transaction_id, :part_id]
    add_index :transaction_parts, [:transaction_id, :parts_kit_id]
  end
end
