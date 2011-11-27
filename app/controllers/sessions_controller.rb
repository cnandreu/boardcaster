# 
# @author: Carlos Andreu
# def new: Show the login page
# def create: sets the session cookie for a user if the credentials given are valid
# def destroy: destroys the session cookie (user decided to logout)

class SessionsController < ApplicationController

  def new
    @title = "Login"
  end

  def create
    @title = "Login"
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :success => "Logged in!"
    else
      flash.now[:error] = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    @title = "Logout"
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
   
end
