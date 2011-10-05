class SessionsController < ApplicationController

  def new
    @title = "Login"
  end

  def create
    @title = "Login"
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :success => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    @title = "Logout"
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
   
end