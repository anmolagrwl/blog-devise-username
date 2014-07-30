class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
  def index
  	@commentable = Article.find(params[:article_id])
    @comments = @commentable.comments
  end

  def new
  	@commentable = Article.find(params[:article_id])
	  @comment = @commentable.comments.new
	end
	  
	def create
		@commentable = Article.find(params[:article_id])
	  @comment = @commentable.comments.new(comment_params)
	  if @comment.save
	    redirect_to @commentable, notice: "Comment created."
	  else
	    render :new
	  end
	end

	private
  	def comment_params
  		params.require(:comment).permit(:content)
  	end
end
