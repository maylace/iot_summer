require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  before(:each) do
    @house = FactoryGirl.create(:house)
    @device = FactoryGirl.create(:device)
    @log = FactoryGirl.create(:json_log_devices)
  end

  describe "POST #create" do
    it 'creates new devices' do
      expect{
        post :create, house: FactoryGirl.create(:house),
          device: FactoryGirl.attributes_for(:device)
      }.to change(Device, :count).by(1)

    end

    it 'should belong to house' do
      t = House.reflect_on_association(:device)
      t.macro.should == :has_many
    end

    it 'should create json_log_device' do
      expect{
      post :create, device: FactoryGirl.create(:device),
        log: FactoryGirl.create(:JsonLogDevice)
      }.to change(JsonLogDevice, :count).by(1)
    end

    it 'should redirect to houses page' do
      post :create, house: FactoryGirl.create(:house),
          device: FactoryGirl.attributes_for(:device)
      response.should redirect_to houses_path
    end
  end
  describe "GET #show" do
    it 'assigns the requested device' do
      house = FactoryGirl.create(:house)
      device = FactoryGirl.create(:device)
      get :show, id: device
      assigns(:device).should eql(device)
    end

    it 'renders the #show view' do
      get :show, id: FactoryGirl.create(:device)
      response.should render_template :show
    end


  describe 'PUT #update' do
    before(:each) do
      @device = FactoryGirl.create(:device)
    end

    it 'changes @device attributes' do
      put :update, id: @device,
        device: FactoryGirl.attributes_for(:device,name: "name", temperature: 1.15)
      @device.reload
      @device.name.should eql("name")
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @house = FactoryGirl.create(:device)
    end

    it 'deletes the house' do
      expect{
        delete :destroy, id: @device
      }.to change(Device, :count).by(-1)
    end

    it 'redirects to house#index' do
      delete :destroy, id: @device
      response.should redirect_to houses_path
    end
  end
end
end

