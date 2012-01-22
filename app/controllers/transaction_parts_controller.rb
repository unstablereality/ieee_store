class TransactionPartsController < ApplicationController
  def new
    @transaction_part = TransactionPart.new
  end
  
  def create
    @transaction_part = TransactionPart.new(params[:transaction_part])
    if (@transaction_part.save)
      redirect_to :back
    else
      flash.alert = "Save Failed!"
      render :new
    end
  end
  
  def show
    @transaction_part = TransactionPart.find(params[:id])
  end
  
  def index
    @transaction_parts = TransactionPart.all
  end
  
  def edit
    @transaction_part = TransactionPart.find(params[:id])
  end
  
  def update
    @transaction_part = TransactionPart.find(params[:id])
    if (@transaction_part.update_attributes(params[:transaction_part]))
      redirect_to "/transactions/#{@transaction_part.transaction_id}/edit"
    else
      flash.alert = "Update Failed!"
      render :edit
    end
  end
  
  def destroy
    @transaction_part = TransactionPart.find(params[:id])
    if (@transaction_part.delete)
      flash.notice = "TransactionPart Successfully Deleted"
      redirect_to :back
    else
      flash.alert = "Destroy Failed!"
      redirect_to :back
    end
  end
end
