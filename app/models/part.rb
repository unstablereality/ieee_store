class Part < ActiveRecord::Base
  validates :name, :uniqueness => true, 
                   :presence => true
  validates :description, :presence => true
  validates :jameco_pn, :uniqueness => true, 
                        :presence => true
  validates :quantity, :numericality => { :less_than_or_equal_to => 999 }
  validates :nominal_quantity, :numericality => { :less_than_or_equal_to => 999 }
end
