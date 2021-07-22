class SessionsController < ApplicationController
  def new
  end
  
  def create
    cleanEmail = params[:email].strip
    userPassword = params[:password]
    user = User.authentication(cleanEmail, userPassword)
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end