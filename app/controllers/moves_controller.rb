class MovesController < ApplicationController

  def create
    m = Move.new
    last_game = Game.last
    if !last_game.nil? 
      m.game_id = last_game.id
    end
    m.move_data = params[:move_data]
    if m.save
      render :text => "#{m.move_data}"
    else
      render :text => "FAIL"
    end
  end


  def index
    last_move = Move.last
    if last_move.nil?
      render :text => "FAIL"
    else
      render :text => "#{last_move.move_data}"
    end
  end

end
