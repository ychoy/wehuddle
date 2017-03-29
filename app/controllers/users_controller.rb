class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find_by_id(params[:id])
    @memberships = @user.memberships
    # allows sidebar menu to populate
    @chatrooms = Chatroom.all
    #includes method for eager loading
    @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])

    #allows new messages to be created
    @message = Message.new
  end

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end
