class CreateTransactionParts < ActiveRecord::Migration
  def change
    create_table :transaction_parts do |t|
      t.integer :transaction_id
      t.integer :part_id
      t.integer :part_quantity
    
      t.timestamps
    end
  end
end
