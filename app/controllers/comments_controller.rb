#
# @author: Carlos Andreu
#
# def create: saves new comments to the data base and reports if it was
# successful or if there was a failure. 

class CommentsController < ApplicationController

  def create
    @title = "New Comment"
    @game = Game.find(params[:comment][:game_id])
    
    params[:comment][:user_id] = current_user.id
    @comment = Comment.new(params[:comment])

    if @comment.save
      @last_comment = Comment.last
      @last_author = User.find_by_id(@last_comment.user_id)
      
      respond_to do |format|
        format.html { redirect_to @game }
        format.js
      end
    else
      redirect_to @game, :flash => { :error => "Invalid comment." }
  end
  end
end
