class RolesController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @users = Role.all
    json_response(@users)
  end
end
