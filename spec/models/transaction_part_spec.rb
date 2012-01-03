require 'spec_helper'
describe TransactionPart do
  it {should belong_to(:transaction)}
  it {should belong_to(:part)}
  it {should validate_numericality_of(:part_quantity)}
end
