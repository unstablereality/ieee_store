require 'spec_helper'
describe PartsController do
  context 'GET new' do
    before {
      @part = mock('testingpart')
      Part.expects(:new).returns(@part)
      get :new
    }
    it {should render_template(:new)}
    it {should assign_to(:part).with(@part)}
  end
  context 'POST create' do
    before {
      @part = mock('testingpart')
      Part.expects(:new).returns(@part)
    }
    context 'Save Succeeds' do
      before {
        @part.expects(:save).returns(true)
        post :create, :part => {}
      }
      it {should redirect_to(:parts)}
    end
    context 'Save Failed' do
      before {
        @part.expects(:save).returns(false)
        post :create, :part => {}
      }
      it {should set_the_flash}
      it {should render_template(:new)}
    end
  end
  context 'GET show' do
    before {
      @part = mock('testingpart')
      Part.expects(:find).returns(@part)
      get :show, :id => 1
    }
    it {should assign_to(:part).with(@part)}
    it {should render_template(:show)}
  end
  context 'GET index' do
    before {
      @parts = mock('testingpart')
      Part.expects(:all).returns(@parts)
      get :index
    }
    it {should assign_to(:parts).with(@parts)}
    it {should render_template(:index)}
  end
  context 'GET edit' do
    before {
      @part = mock('testingpart')
      Part.expects(:find).returns(@part)
      get :edit, :id => 1
    }
    it {should render_template(:edit)}
    it {should assign_to(:part).with(@part)}
  end
  context 'PUT update' do
    before {
      @part = Factory.build(:part)
      Part.expects(:find).returns(@part)
    }
    context 'Save Succeeds' do
      before {
        @part.expects(:update_attributes).returns(true)
        put :update, :id => 1, :part => {}
      }
      it {should redirect_to(:parts)}
    end
    context 'Save Failed' do
      before {
        @part.expects(:update_attributes).returns(false)
        put :update, :id => 1, :part => {}
      }
      it {should set_the_flash}
      it {should render_template(:edit)}
    end
  end
  context 'DELETE destroy' do
    before {
      @part = mock('testingpart')
      Part.expects(:find).returns(@part)
    }
    context 'Delete Succeeds' do
      before {
        @part.expects(:delete).returns(true)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Success/)}
      it {should redirect_to(:parts)}
    end
    context 'Delete Failed' do
      before {
        @part.expects(:delete).returns(false)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Failed/)}
      it {should redirect_to(:parts)}      
    end
  end
end
