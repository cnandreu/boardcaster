class CommentsController < ApplicationController
  
  def index
  end
  
  def create
    @title = "New Comment"
    @game = Game.find(params[:comment][:game_id])
    
    params[:comment][:user_id] = current_user.id
    @comment = Comment.new(params[:comment])
    if @comment.save
      #redirect_to(@game, :success => 'Comment was successfully created.')
      redirect_to @game, :flash => { :success => "Comment created." }
    else
      #redirect_to(@game, :error => 'Comment was not created.')
      redirect_to @game, :flash => { :error => "Invalid comment." }
    end
  end
  
end



