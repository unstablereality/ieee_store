require 'spec_helper'
describe KitComponentsController do
  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  context 'GET new' do
    before {
      @kit_component = mock('testcomponent')
      KitComponent.expects(:new).returns(@kit_component)
      get :new
    }
    it {should assign_to(:kit_component).with(@kit_component)}
  end

  context 'POST create' do
    before {
      @kit_component = mock('testcomponent')
      KitComponent.expects(:new).returns(@kit_component)
    }
    context 'Save Succeeds' do
      before {
        @kit_compnent.expects(:save).returns(true)
        post :create, :kit_component => {}
      }
      it {should redirect_to( "where_i_came_from" )
    }
    end
    context 'Save Failed' do
      before {
        @kit_component.expects(:save).returns(false)
        post :create, :kit_component => {}
      }
      it {should set_the_flash}
      it {should redirect_to( "where_i_came_from" )
    }
    end
  end
  
=begin
  context 'GET show' do
    before {
      @parts_kit = mock('testcomponent')
      PartsKit.expects(:find).returns(@parts_kit)
      get :show, :id => 1
    }
    it {should assign_to(:parts_kit).with(@parts_kit)}
    it {should render_template(:show)}
  end
  context 'GET index' do
    before {
      @parts_kits = mock('testcomponent')
      PartsKit.expects(:all).returns(@parts_kits)
      get :index
    }
    it {should assign_to(:parts_kits).with(@parts_kits)}
    it {should render_template(:index)}
  end
  context 'GET edit' do
    before {
      @parts_kit = mock('testcomponent')
      PartsKit.expects(:find).returns(@parts_kit)
      get :edit, :id => 1
    }
    it {should render_template(:edit)}
    it {should assign_to(:parts_kit).with(@parts_kit)}
  end
  context 'PUT update' do
    before {
      @parts_kit = Factory.build(:parts_kit)
      PartsKit.expects(:find).returns(@parts_kit)
    }
    context 'Save Succeeds' do
      before {
        @parts_kit.expects(:update_attributes).returns(true)
        put :update, :id => 1, :parts_kit => {}
      }
      it {should redirect_to("/parts_kits/#{@parts_kit.id}")}
    end
    context 'Save Failed' do
      before {
        @parts_kit.expects(:update_attributes).returns(false)
        put :update, :id => 1, :part => {}
      }
      it {should set_the_flash}
      it {should render_template(:edit)}
    end
  end
  context 'DELETE destroy' do
    before {
      @parts_kit = mock('testcomponent')
      PartsKit.expects(:find).returns(@parts_kit)
    }
    context 'Delete Succeeds' do
      before {
        @parts_kit.expects(:delete).returns(true)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Success/)}
      it {should redirect_to(:parts_kits)}
    end
    context 'Delete Failed' do
      before {
        @parts_kit.expects(:delete).returns(false)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Failed/)}
      it {should redirect_to(:parts_kits)}      
    end
  end
=end
end
