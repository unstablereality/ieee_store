class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :student_email
      t.integer :transaction_total
      t.boolean :sale_completed, :default => false
      
      t.timestamps
    end
  end
end
