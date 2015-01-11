require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET :index' do
    context 'while signed in' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        get :index, format: :json
      end
      it { should respond_with :ok }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(assigns(:users)).to eq User.all }
    end
    context 'while not signed in' do
      before do
        get :index, format: :json
      end
      it { expect(response.status).to eq 401 }
    end
  end

  describe 'POST :create' do
    before do
    end
  end
end
