class TransactionPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :parts_kit
  belongs_to :transaction
  validates :part_quantity, :numericality => true
  #before_destroy :return_inventory
  attr_accessor :item_id
  before_create :populate_item_id
  before_update :populate_item_id
  
  protected
    def return_inventory
      puts "Returning Inventory"
      @quantity = self.part.quantity + self.part_quantity
      self.part.update_attribute(:quantity, @quantity)
    end
    
    def populate_item_id
      if self.part_id
        self.item_id = self.part_id
      else
        self.item_id = -self.parts_kit_id
      end
    end
end
