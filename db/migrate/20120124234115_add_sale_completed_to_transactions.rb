class AddSaleCompletedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :sale_completed, :boolean, :default => false
  end
end
