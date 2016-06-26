require 'rails_helper'

RSpec.describe HousesController, type: :controller do
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
      it 'creates new house' do
        expect {
          post :create, user: FactoryGirl.create(:user), house: FactoryGirl.attributes_for(:house)
        }.to change(House, :count).by(1)
      end
      it 'redirects to new house' do
        post :create, user: FactoryGirl.create(:user), house: FactoryGirl.attributes_for(:house)
        response. should redirect_to houses_url
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested house' do
      user = FactoryGirl.create(:user)
      house = FactoryGirl.create(:house)

      get :show, id: house
      assigns(:house).should eq(house)
    end
  end
end
