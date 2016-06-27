require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates new device' do
        expect {
          post :create, device: FactoryGirl.create(:house), house: FactoryGirl.attributes_for(:device)
        }.to change(House, :count).by(1)
      end
      it 'redirects to  house_page' do
        post :create, house: FactoryGirl.create(:house), device: FactoryGirl.attributes_for(:device)
        response. should redirect_to houses_url
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested house' do
      house = FactoryGirl.create(:user)
      device = FactoryGirl.create(:device)

      get :show, id: device
      assigns(:device).should eq(device)
    end

    it 'renders the #show view' do
      get :show, id: FactoryGirl.create(:device)
      response.should render_template :show
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @house = FactoryGirl.create(:device)
    end

    it 'assigns corect House' do
      put :update, id: @device, house: FactoryGirl.attributes_for(:device)
      assigns(:house).should eq(@house)
    end

    it 'changes @house attributes' do
      put :update, id: @device,
        device: FactoryGirl.attributes_for(:device, name: 'Dev1')
      @device.reload
      @device.name.should eq('Device')
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @device = FactoryGirl.create(:device)
    end

    it 'deletes the device' do
      expect{
        delete :destroy, id: @device
      }.to change(Device, :count).by(-1)
    end

    it 'redirects to house_page' do
      delete :destroy, id: @device
      response.should redirect_to house_path
    end

  end
end
