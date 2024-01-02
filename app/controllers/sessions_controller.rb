class SessionsController < ApplicationController

  def new
    
  end
  
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # put user id in session
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user),
                  notice: "Welcome back, #{user.name}"
      session[:indended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_url, status: :see_other,
      notice: "Your are now signed out!"
  end

end
