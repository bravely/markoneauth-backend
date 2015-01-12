require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET :create, format: :json' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, format: 'json', user: {
        email: user.email,
        password: user.password
      }
    end

    it { expect(response.status).to eq 201 }
    it 'sends the expected data' do
      data = {
        token: user.authentication_token,
        user_email: user.email
      }
      expect(assigns(:data)).to eq data
    end
  end
end
