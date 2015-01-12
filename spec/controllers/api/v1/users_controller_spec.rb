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
    let(:email) { Faker::Internet.email }
    context 'with valid params' do
      before do
        post :create, user: {
          email: email,
          password: 'markonewoo',
          password_confirmation: 'markonewoo'
        }, format: :json
      end
      it { should respond_with :ok }
      it { expect(response.content_type).to eq 'application/json' }
      it { expect(User.find_by_email(email)).to exist_in_database }
    end
    context 'with invalid params' do
      before do
        post :create, user: {
          email: email,
          password: 'mark',
          password_confirmation: 'mark'
        }, format: :json
      end
      it { should respond_with :unprocessable_entity }
      it { expect(response.content_type).to eq 'application/json' }
    end
  end
end
