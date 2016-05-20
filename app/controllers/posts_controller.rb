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

  private 
    def expense_params
      params.require(:post).permit(:title, :body, :category_id)
    end
end
