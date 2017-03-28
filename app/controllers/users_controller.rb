class UsersController < ApplicationController
  def show
  	@user = User.find_by_id(params[:id])
    @memberships = @user.memberships
  end
end
