class KitComponent < ActiveRecord::Base
  before_create :set_defaults
  belongs_to :part
  belongs_to :parts_kit
  #validates :part_quantity, :numericality => true
  private
    def set_defaults
      self.part_quantity ||= 0
    end
end
