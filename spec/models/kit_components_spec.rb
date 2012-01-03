require 'spec_helper'
describe KitComponent do
  it {should belong_to(:parts_kit)}
  it {should belong_to(:part)}
  it {should validate_numericality_of(:part_quantity)}
end
