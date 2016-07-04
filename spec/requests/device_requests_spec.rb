require "rails_helper"

RSpec.describe "Request devices", :type => :request do
  describe 'PUT #user_update' do
    before(:each) { @device = FactoryGirl.create(:device) }

    it 'sends request succesfully' do
      put "/devices/#{@device.id}/stat", device: FactoryGirl.attributes_for(:device)
      expect(response).to have_http_status(200)
    end

    it 'finds correct device type and data' do
      put "/devices/#{@device.id}/stat", device: FactoryGirl.attributes_for(:device, type: 'Fridge')
      assigns(:device)['type'].should eq(@device.type)
    end

    it 'updates data given from a source' do
      put "/devices/#{@device.id}/stat", device: FactoryGirl.attributes_for(:device, temperature: 0.2)
      @device.reload
      @device.temperature.should eq(assigns(:device)['temperature'])
    end
  end
end
