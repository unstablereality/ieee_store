class AddSecurityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :security, :string, :default => "shopkeeper"
  end
end
