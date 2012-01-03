class Transaction < ActiveRecord::Base
  has_many :transaction_parts, :dependent => :delete_all
  validates :student_email, :presence => true
end
