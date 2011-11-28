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
      respond_to do |format|
        format.js
        format.html { redirect_to @game, :flash => { :success => "Comment created." }}
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to @game, :flash => { :error => "Invalid comment." }}
      end
    end
  end
end
