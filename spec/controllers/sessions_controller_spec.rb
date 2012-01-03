require 'spec_helper'
describe SessionsController do
    it {should respond_to(:new)}
    it {should respond_to(:show)}
  context 'POST create' do
    before {
      post :create
    }
    it {should redirect_to("sessions/show")}
  end
=begin
  context 'GET index' do
    before {
      @sessions = mock('testsession')
      Session.expects(:all).returns(@sessions)
      get :index
    }
    it {should assign_to(:sessions).with(@sessions)}
    it {should render_template(:index)}
  end
=end
  context 'DELETE destroy' do
    before {
      delete :destroy, :id => 37
    }
    it {should redirect_to(root_url)}
  end
end
