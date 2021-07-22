class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_info)

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup' 
    end
  end
  private
  def user_info
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end 