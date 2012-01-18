class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @lasttrans = Transaction.last
  end
  def create
    @transaction = Transaction.new(params[:transaction])
    if (@transaction.save)
      redirect_to :transactions
    else
      flash.alert = "Sale Failed!"
      render :new
    end
  end
  def show
    @transaction = Transaction.find(params[:id])
  end
  def index #history search results
    @transactions = Transaction.all 
  end
  def destroy
    @transaction = Transaction.find(params[:id])
    if (@transaction.delete)
      flash.notice = "Transaction Successfully Cancelled"
      redirect_to :transactions    
    else
      flash.alert = "Destroy Failed!"
      redirect_to :transactions
    end
  end
end
