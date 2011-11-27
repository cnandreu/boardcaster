#
# @author: Carlos Andreu
#
# def home, contact, help, about, search: sets the title for static pages
# def seach: show search results

class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

  def about
    @title = "About"
  end

  def search
    @title = "Search Results"
    @results = Game.search(params[:search])
  end

  # Code below is used just for testing if strings of fens and the end token (***)
  # are interpreted correctly by the system.  

private 
  def addfens

   my_fens = [
        "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR b KQkq - 0 1",
        "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1",
        "rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 1",
        "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 0 1",
        "***"
          ] 
  
   my_fens.each do |item|
    move = Move.new
    move.game_id = Game.last.id
    move.move_data = item
    move.save
  end

    game = Game.last
    game.live = false
    game.save


  render 'home' 

  end


end
