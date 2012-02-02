class AddPartsKitIdToTransactionParts < ActiveRecord::Migration
  def change
    add_column :transaction_parts, :parts_kit_id, :integer
  end
end
