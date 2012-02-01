class TransactionPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :transaction
  validates :part_quantity, :numericality => true
  before_destroy :return_inventory
  
  protected
    def return_inventory
      puts "Returning Inventory"
      @quantity = self.part.quantity + self.part_quantity
      self.part.update_attribute(:quantity, @quantity)
    end
end
