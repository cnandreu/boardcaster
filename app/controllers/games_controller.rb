class GamesController < ApplicationController

  before_filter :require_login, :only => [:index, :show, :new]

  def index
    @title = "View Games"
    #@games = Game.all
    @games = Game.order("created_at").page(params[:page]).per(1)
  end

  def show
    @game = Game.find(params[:id])
    @users = User

    move_array = Move.find_all_by_game_id(22).map{ |a| a.move_data.strip}

    @alg_array = fenalg ["rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1", "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1"]

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
