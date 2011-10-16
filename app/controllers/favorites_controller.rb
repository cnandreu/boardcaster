class FavoritesController < ApplicationController
 
  def create
    
    game_id = params[:favorite][:game_id]
    user_id = current_user.id
    params[:favorite][:user_id] = user_id
        
    @game = Game.find(game_id)
    
    favorite = Favorite.where(:game_id => game_id, :user_id => user_id);
    
    if favorite.count == 0
      Favorite.new(params[:favorite]).save
    else
      favorite.destroy_all
    end
     redirect_to(@game)

  end  
end
