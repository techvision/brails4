class CommentsController < ApplicationController
  before_filter :find_commentable

  def index
    @comments = @commentable.comments
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @commentable.comments.build
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      redirect_to @commentable
    else
      render action: :new 
      flash[:error] = "Comment could not be created"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @commentable, notice: "Comment successfully updated"
    else
      redirect_to @commentable 
      flash[:error] = "Comment could not be updated" 
    end
  end  

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @commentable, notice: "Comment successfully deleted."
    else
      flash[:error] = "Could not delete comment. Comment inexistent."
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_commentable
    klass = [Level,Topic,Content].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
