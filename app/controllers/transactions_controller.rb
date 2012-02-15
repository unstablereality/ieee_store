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
    dropdown
    update_trans_total
  end
  
  def update
    @transaction = Transaction.find(params[:id])
    if (@transaction.update_attributes(params[:transaction]))
      if params[:commit] == "Complete Sale"
        #StoreMailer.store_invoice(@transaction).deliver
        @transaction.update_attribute(:sale_completed, true)
      end
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
  def dropdown
    @dropdown_list = []
    
    PartsKit.where(:deprecated => false).each do |k|
      @dropdown_list << [k.name, -k.id]
    end
    
    Part.where(:deprecated => false).each do |p|
      @dropdown_list << [p.name_and_desc, p.id]
    end
  end
  
  def update_trans_total
    @runningtotal = Money.new(0, "USD")
    @transaction.transaction_parts.each do |p|
      @runningtotal += p.current_price * p.part_quantity
    end
    @transaction.update_attribute(:transaction_total, @runningtotal)
  end
end
