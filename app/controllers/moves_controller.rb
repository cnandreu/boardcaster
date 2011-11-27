#
# @author: Carlos Andreu
#
# def create: Write a new move to the DB
# def index: show the last move on the DB for the last game
# def mgame: destroy the finish game token (***) and redirect to current game
# with replay controls

class MovesController < ApplicationController

  def create
    m = Move.new
    last_game = Game.last
    if !last_game.nil? 
      m.game_id = last_game.id
    end

    data = params[:move_data]

    m.move_data = data

    if data == "***"
        last_game.live = false
        last_game.save
    end

    if m.save
      render :text => "#{m.move_data}"
    else
      render :text => "FAIL"
    end
  end


  def index
    last_game = Game.last
    last_move = Move.last

    if !last_move.nil? and last_move.move_data == "***"
      render :text => "***"
    elsif last_move.nil? or !last_game.live or (last_game.id != last_move.game_id)
      render :text => "FAIL"
    else
      render :text => "#{last_move.move_data}"
    end
  end

  def mgame
    last_game = Game.last
    last_move = Move.last

    if !last_move.nil? and last_move.move_data == "***"
      last_move.destroy
    end

  redirect_to :controller => 'games', :action => :show, :id => last_game.id

  end

end
