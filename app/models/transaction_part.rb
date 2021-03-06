class TransactionPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :parts_kit
  belongs_to :transaction
  validates :part_quantity, :numericality => true
  before_destroy :return_inventory
  attr_accessor :item_id
  before_create :populate_item_id
  before_create :check_uniqueness
  before_create :check_avail
  before_update :populate_item_id
  
  composed_of :display_current_price,
    :class_name => 'Money',
    :mapping => [%w(current_price cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, "USD") },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
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
      @transaction_part = TransactionPart.where(:part_id => self.part_id, :transaction_id => self.transaction_id, :parts_kit_id => self.parts_kit_id).first
      if @transaction_part
        @quantity = @transaction_part.part_quantity + self.part_quantity
        self.part_quantity= @quantity
        @transaction_part.destroy
      end
    end
    
    def check_avail
      if self.item_id > 0
        if (self.part.quantity - self.part_quantity) < 0
          raise Errors::InsufficientSupplyError, "ERROR: Tried to purchase #{self.part_quantity} #{self.part.name.pluralize} but there are only #{self.part.quantity} in stock."
        end
      else
        self.parts_kit.kit_components.each do |kc|
          @existing_kit_quantity = kc.part.quantity / kc.part_quantity
          @trans_quantity = self.part_quantity
          @quantity = @existing_kit_quantity - @trans_quantity
          if (@quantity) < 0
            if (@low_qty)
              if (@quantity < @low_qty)
                @low_qty = @quantity
                @component = kc
              end
            else
              @low_qty = @quantity
              @component = kc
            end
          end
        end
        if (@low_qty)
          @kit_quantity = @component.part.quantity / @component.part_quantity
          raise Errors::InsufficientSupplyError, "ERROR: Tried to purchase #{self.part_quantity} #{self.parts_kit.name.pluralize} but there are only #{@component.part.quantity} #{@component.part.name.pluralize} (#{@kit_quantity} #{self.parts_kit.name.pluralize}) in stock."
        end
      end
    end
end
