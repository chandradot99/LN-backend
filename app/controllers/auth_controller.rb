class AuthController < ApplicationController
  skip_before_action :authenticate_request
 
  def login
    command = AuthenticateUser.call(params[:email], params[:password])
 
    if command.success?
      json_response({ auth_token: command.result })
    else
      json_response({ error: command.errors }, :unauthorized)
    end
  end
 end
