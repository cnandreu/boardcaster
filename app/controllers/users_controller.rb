class UsersController < ApplicationController

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @title = "Sign up"
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      redirect_back_or_to root_url, :success => "Signed up!"
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @title = "Profile | #{@user.username}"
    @games = Game.find_all_by_user_id_white(@user.id) + Game.find_all_by_user_id_black(@user.id)
  end

end
