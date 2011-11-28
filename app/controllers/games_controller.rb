#
# @author: Carlos Andreu
# 
# def index: Lists all games in the DB with pagina
# def show: Presents users with game data, un/liked button and comments.
# def new: If there is not a game in progress it allows users to create a new game
# def create: Takes the input from the user in 'def new' and writes it to the DB
#
class GamesController < ApplicationController

  before_filter :require_login, :only => [:index, :show, :new]

  def index
    @title = "View Games"
    #If you don't want pagination:
    #@games = Game.all
    @games = Game.order("created_at").page(params[:page]).per(5) #per = number of pages
  end

  def show
    @game = Game.find(params[:id])
    @users = User

    #Get an Array of fens that match the current game id
    move_array = Move.find_all_by_game_id(@game).map{ |a| a.move_data.strip}

    #Remove characters that mark an finished game
    move_array.delete_if{|i| i=="***" or i=="**"}

    #Generate a PGN String based on the FEN Array, the method is in the
    #"application_controller"
    @pgn_string = fens2pgn(move_array) 

    if !@game.nil? && User.exists?(@game.user_id_white) && User.exists?(@game.user_id_black) 

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
    if !Game.last.nil? && Game.last.live
      @game = Game.last
      redirect_to @game, :flash => { :error => "Game in progress." }
    else
      @game = Game.new
      @users = User
    end
  end

  def create 
    @title = "Create a Game"
    @game = Game.new(params[:game])
    @game.live = true
    if @game.save
      redirect_to @game, :flash => { :success => "Game created!" }
    else
      render :new
    end
  end

end
