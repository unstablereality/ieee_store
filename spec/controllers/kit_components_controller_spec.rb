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
        @kit_component.expects(:save).returns(true)
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
  
  context 'GET edit' do
    before {
      @kit_component = mock('testcomponent')
      KitComponent.expects(:find).returns(@kit_component)
      get :edit, :id => 1
    }
    it {should render_template(:edit)}
    it {should assign_to(:kit_component).with(@kit_component)}
  end
  
  context 'PUT update' do
    before {
      @kit_component = Factory.build(:kit_component)
      KitComponent.expects(:find).returns(@kit_component)
    }
    context 'Save Succeeds' do
      before {
        @kit_component.expects(:update_attributes).returns(true)
        put :update, :id => 1, :kit_component => {}
      }
      it {should redirect_to("/parts_kits/#{@kit_component.parts_kit_id}/edit")}
    end
    context 'Save Failed' do
      before {
        @kit_component.expects(:update_attributes).returns(false)
        put :update, :id => 1, :part => {}
      }
      it {should set_the_flash}
      it {should render_template(:edit)}
    end
  end
  
  context 'DELETE destroy' do
    before {
      @kit_component = mock('testcomponent')
      KitComponent.expects(:find).returns(@kit_component)
    }
    context 'Delete Succeeds' do
      before {
        @kit_component.expects(:delete).returns(true)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Success/)}
      it {should redirect_to("where_i_came_from")}
    end
    context 'Delete Failed' do
      before {
        @kit_component.expects(:delete).returns(false)
        delete :destroy, :id =>1
      }
      it {should set_the_flash.to(/Failed/)}
      it {should redirect_to("where_i_came_from")}      
    end
  end
end
