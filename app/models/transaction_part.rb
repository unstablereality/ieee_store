class TransactionPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :parts_kit
  belongs_to :transaction
  validates :part_quantity, :numericality => true
  before_destroy :return_inventory
  attr_accessor :item_id
  before_create :populate_item_id, :check_uniqueness
  before_create :check_avail
  before_update :populate_item_id
  
  protected
    def return_inventory
      puts "Returning Inventory"
      if self.part_id
        @quantity = self.part.quantity + self.part_quantity
        self.part.update_attribute(:quantity, @quantity)
      else
        self.parts_kit.kit_components.each do |kc|
          @quantity = kc.part.quantity + (self.part_quantity * kc.part_quantity)
          kc.part.update_attribute(:quantity, @quantity)
        end
      end
    end
    
    def populate_item_id
      if self.part_id
        self.item_id = self.part_id
      else
        self.item_id = -self.parts_kit_id
      end
    end
    
    def check_uniqueness
      if TransactionPart.where(:part_id => self.part_id, :transaction_id => self.transaction_id, :parts_kit_id => self.parts_kit_id).count > 0
        return false
      end
    end
    
    def check_avail
      if self.item_id > 0
        if (self.part.quantity - self.part_quantity) <= 0
          return false
        end
      else
        self.parts_kit.kit_components.each do |kc|
          if (kc.part.quantity - (self.part_quantity * kc.part_quantity)) <= 0
            return false
          end
        end
      end
    end
end
