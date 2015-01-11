class Api::V1::UsersController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user!, only: :create

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(sign_up_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.messages }, status: 400
    end
  end

  private

  def sign_up_params
    params.require(:user).permit([
      :email,
      :password,
      :password_confirmation
    ])
  end
end
