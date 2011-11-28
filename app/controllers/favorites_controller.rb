#
# @author: Carlos Andreu
#
# def create: Marks game as "Liked" if it's not liked and "Unliked" if it's
# liked when clicked. 

class FavoritesController < ApplicationController
 
  def create
    
    game_id = params[:favorite][:game_id]
    user_id = current_user.id
    @game = Game.find(game_id)
    
    favorite = Favorite.where(:game_id => game_id, :user_id => user_id);

    
    if favorite.count == 0
      f = Favorite.new      
      f.user_id = user_id
      f.game_id = game_id
      f.save
    else
      favorite.destroy_all
    end
     
    respond_to do |format|
        format.html { redirect_to @game }
        format.js
    #redirect_to(@game)
      end

  end  
end
