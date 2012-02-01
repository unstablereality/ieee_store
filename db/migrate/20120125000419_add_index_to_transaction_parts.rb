class AddIndexToTransactionParts < ActiveRecord::Migration
  def change
    add_index :transaction_parts, [:transaction_id, :part_id], :unique => true
  end
end
