class Part < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :jameco_pn, :uniqueness => true,
                   :presence => true
  validates :quantity, :numericality => { :less_than_or_equal_to => 999 }
  validates :nominal_quantity, :numericality => { :less_than_or_equal_to => 999 }

  composed_of :display_single_cost,
    :class_name => 'Money',
    :mapping => [%w(single_cost cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, "USD") },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  composed_of :display_lot_cost,
    :class_name => 'Money',
    :mapping => [%w(lot_cost cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, "USD") },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  composed_of :display_student_price,
    :class_name => 'Money',
    :mapping => [%w(student_price cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, "USD") },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  def name_and_desc
     name + ' ' + description + ' (' + jameco_pn + ')'
  end
end

