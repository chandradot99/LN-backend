class AuthController < ApplicationController
  skip_before_action :authenticate_request
 
  def login
    command = AuthenticateUser.call(params[:email], params[:password])
 
    if command.success?
      json_response(command.result)
    else
      json_response({ error: command.errors }, :unauthorized)
    end
  end

  def sign_up
    @user = User.create!(sign_up_params)
    auth_token = JsonWebToken.encode(user_id: @user.id)

    json_response({ user: @user, auth_token: auth_token })
  end

  private

  def sign_up_params
    # whitelist params
    params.permit(:name, :email, :mobile_number, :role_id, :password, :password_confirmation)
  end
 end
