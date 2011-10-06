class GamesController < ApplicationController
  
  def index
    @title = "Games"
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @title = "Game | #{@game.title}"
  end

  def new
  end

end
