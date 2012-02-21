class AddCurrencyToParts < ActiveRecord::Migration
  def change
    add_column :parts, :currency, :string
  end
end
