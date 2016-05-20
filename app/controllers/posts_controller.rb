class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new

  end

  def create
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end 

  def downvote 
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end 

  private 
    def expense_params
      params.require(:post).permit(:title, :body, :category_id)
    end
end
