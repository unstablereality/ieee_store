class Transaction < ActiveRecord::Base
  has_many :transaction_parts, :dependent => :destroy
  validates :student_email, :presence => true,
                            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  composed_of :display_transaction_total,
    :class_name => 'Money',
    :mapping => [%w(transaction_total cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, "USD") },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
