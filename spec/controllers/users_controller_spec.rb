require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create " do
    context 'when it is succesfully created' do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }
      end
      it { should respond_with 200 }
    end

    context 'when its not succesfull' do
      before(:each) do
        @invalid_user_attributes = { password: '1245678',
                                    password_confirmation: '12378'}
        post :create, { user: @invalid_user_attributes }
      end

      it { should respond_with 422 }
    end
  end
end
