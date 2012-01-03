class TransactionPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :transaction
  validates :part_quantity, :numericality => true
end
