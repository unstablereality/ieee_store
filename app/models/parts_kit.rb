class PartsKit < ActiveRecord::Base
  has_many :kit_components
  validates :name, :presence => true
  
  composed_of :display_kit_price,
    :class_name => 'Money',
    :mapping => [%w(kit_price cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, "USD") },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
