class StoreMailer < ActionMailer::Base
  default :from => "IEEE Parts Store <universityofmemphis.ieee@gmail.com>"

  def store_invoice(transaction)
    @transaction = transaction
    mail(:to => transaction.student_email, :bcc => "universityofmemphis.ieee@gmail.com",:subject => "Invoice for IEEE Order No: #{transaction.id}")
  end
  
  #stub for password reset email once authentication is added
  def password_reset
    
  end
end
