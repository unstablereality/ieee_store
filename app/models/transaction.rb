class Transaction < ActiveRecord::Base
  has_many :transaction_parts, :dependent => :destroy
  validates :student_email, :presence => true
  #before_destroy :close_trans
  
  private
  def update_inventory
    self.transaction_parts.each do |p|
      puts "Inventory Adjusted by #{p.part_quantity}"
      Part.find(p.part_id).update_attributes(:quantity => :quantity - p.part_quantity)
    end
  end
  
  def close_trans
    if !self.sale_completed
      update_inventory
      self.sale_completed = true
    end
  end
end
