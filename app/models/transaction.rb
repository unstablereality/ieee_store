class Transaction < ActiveRecord::Base
  has_many :transaction_parts, :dependent => :destroy
  validates :student_email, :presence => true

end
