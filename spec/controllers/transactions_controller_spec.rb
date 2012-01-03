require 'spec_helper'
describe TransactionsController do
  context 'GET new' do
    before {
      @transaction = mock('testingpart')
      Transaction.expects(:new).returns(@transaction)
      get :new
    }
    it {should render_template(:new)}
    it {should assign_to(:transaction).with(@transaction)}
  end
  context 'POST create' do
    before {
      @transaction = mock('testingpart')
      Transaction.expects(:new).returns(@transaction)
    }
    context 'Save Succeeds' do
      before {
        @transaction.expects(:save).returns(true)
        post :create, :transaction => {}
      }
      it {should redirect_to(:transactions)}
    end
    context 'Save Failed' do
      before {
        @transaction.expects(:save).returns(false)
        post :create, :transaction => {}
      }
      it {should set_the_flash}
      it {should render_template(:new)}
    end
  end
  context 'GET show' do
    before {
      @transaction = mock('testingpart')
      Transaction.expects(:find).returns(@transaction)
      get :show, :id => 1
    }
    it {should assign_to(:transaction).with(@transaction)}
    it {should render_template(:show)}
  end
  context 'GET index' do
    before {
      @transactions = mock('testingpart')
      Transaction.expects(:all).returns(@transactions)
      get :index
    }
    it {should assign_to(:transactions).with(@transactions)}
    it {should render_template(:index)}
  end
  context 'DELETE destroy' do
    before {
      @transaction = mock('testingpart')
      Transaction.expects(:find).returns(@transaction)
    }
    context 'Delete Succeeds' do
      before {
        @transaction.expects(:delete).returns(true)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Success/)}
      it {should redirect_to(:transactions)}
    end
    context 'Delete Failed' do
      before {
        @transaction.expects(:delete).returns(false)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Failed/)}
      it {should redirect_to(:transactions)}      
    end
  end
end
