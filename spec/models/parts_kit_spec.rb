require 'spec_helper'
describe PartsKit do
  it {should have_many(:kit_components)}
  it {should validate_presence_of(:name)}
end
