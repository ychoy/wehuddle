module UsersHelper
  def other_users
    User.all - [current_user]
  end
end
