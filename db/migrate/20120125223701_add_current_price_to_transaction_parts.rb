class AddCurrentPriceToTransactionParts < ActiveRecord::Migration
  def change
    add_column :transaction_parts, :current_price, :integer
  end
end
