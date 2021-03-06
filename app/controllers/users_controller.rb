class UsersController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    params = user_params
    password = SecureRandom.hex(8)

    params[:status] = ['Active', 'Pending', 'Inactive'].sample
    params[:password] = password
    params[:password_confirmation] = password
    @user = User.create!(params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update!(user_params)
    json_response(@user, :ok)
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    json_response(@user, :ok)
  end

  private

  def user_params
    # whitelist params
    params.permit(:name, :email, :mobile_number, :role_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
