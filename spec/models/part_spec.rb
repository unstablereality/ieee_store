require 'spec_helper'
describe Part do
  before {@testpart = Factory(:part)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_uniqueness_of(:jameco_pn)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:jameco_pn)}
  it {should validate_numericality_of(:quantity)}
  it {should validate_numericality_of(:nominal_quantity)}
end
