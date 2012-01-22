class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = Transaction.new(params[:transaction])
    if (@transaction.save)
      redirect_to edit_transaction_path(@transaction)
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
  
  def edit
    @transaction = Transaction.find(params[:id])
  end
  
  def update
    @transaction = Transaction.find(params[:id])
    if (@transaction.update_attributes(params[:transaction]))
      redirect_to "/transaction/#{@transaction.id}"
    else
      flash.alert = "Update Failed!"
      render :edit
    end
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
