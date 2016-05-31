class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]

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
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
    else 
      render "New"
    end 
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post 
    else
       render "Edit"
     end 
  end

  def destroy
    @post.destroy
    @post.avatar = nil 
    @post.save
    redirect_to root_path
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
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :user_id, :avatar)
    end

    def find_post 
      @post = Post.find(params[:id])
    end 
end
