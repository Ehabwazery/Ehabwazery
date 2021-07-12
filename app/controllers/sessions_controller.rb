class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by(email: params[:session][:email])
  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:notice] = "You have logged in successfully"
    redirect_to user
  else
    flash.now[:alert] = "You have entered wrong login details"
    render 'new'    
  end
end

def destroy
  session[:user_id] = nil
  flash[:notice] = "You have been logged out"
  redirect_to root_path
end

end