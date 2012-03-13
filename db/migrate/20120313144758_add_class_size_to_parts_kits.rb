class AddClassSizeToPartsKits < ActiveRecord::Migration
  def change
    add_column :parts_kits, :class_size, :integer, :default => 0
  end
end
