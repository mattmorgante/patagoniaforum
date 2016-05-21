class PostsController < ApplicationController
  def index
    if params[:category].blank?
      @posts = Post.all.order("created_at DESC")
    else 
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC")
    end 
  end

  def new
    @post = Post.new
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
