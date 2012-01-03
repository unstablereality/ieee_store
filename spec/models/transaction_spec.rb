require 'spec_helper'
describe Transaction do
  it {should have_many(:transaction_parts)}
end
