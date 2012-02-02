class AddDeprecatedToPartsKits < ActiveRecord::Migration
  def change
    add_column :parts_kits, :deprecated, :boolean, :default => false
  end
end
