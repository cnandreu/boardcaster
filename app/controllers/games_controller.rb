class GamesController < ApplicationController
  
  before_filter :require_login, :only => [:index, :show, :new]
  
  def index
    @title = "View Games"
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    
    if !@game.nil?
      @title = "Game | #{@game.title}"
    
      @white = User.find_by_id(@game.user_id_white)
      @black = User.find_by_id(@game.user_id_black)
    
      @comments = Comment.where(:game_id => @game.id)
      @comment = Comment.new
      
      @favorite = Favorite.new
      
    else
      flash.now[:error] = "Game not found"
      render :index
    end
    
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