class RolesController < ApplicationController

  def index
    @users = Role.all
    json_response(@users)
  end
end
