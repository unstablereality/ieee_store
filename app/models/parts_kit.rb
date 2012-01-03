class PartsKit < ActiveRecord::Base
  has_many :kit_components
  validates :name, :presence => true
end
