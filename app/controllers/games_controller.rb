class GamesController < ApplicationController
  
  before_filter :require_login, :only => [:index, :show, :new]
  
  def index
    @title = "View Games"
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @title = "Game | #{@game.title}"
    
    @white = User.find(@game.user_id_white)
    @black = User.find(@game.user_id_black)
    
  end

  def new
    @title = "Create a Game"
    @game = Game.new
    @users = User
  end
  
  def create 
    @title = "Create a Game"
    @game = Game.new(params[:game])
    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

end