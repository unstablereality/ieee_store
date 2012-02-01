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
    update_trans_total
  end
  
  def update
    @transaction = Transaction.find(params[:id])
    if (@transaction.update_attributes(params[:transaction]))
      redirect_to "/transactions/#{@transaction.id}"
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  
  def destroy
    @transaction = Transaction.find(params[:id])
    if (@transaction.destroy)
      flash.notice = "Transaction Successfully Cancelled"
      redirect_to :transactions    
    else
      flash.alert = "Destroy Failed!"
      redirect_to :transactions
    end
  end
  
  private 
  def update_trans_total
    @runningtotal = 0
    @transaction.transaction_parts.each do |p|
      @runningtotal += p.current_price * p.part_quantity
    end
    @transaction.update_attribute(:transaction_total, @runningtotal)
  end
end
