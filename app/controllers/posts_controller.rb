class PostsController < ApplicationController
  before_action :authenticate_author!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to post_url(@post)
  else render :new
  end
end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redeirect_to posts_url
  end

 private
 def set_post
  @post = Post.find(params[:id])
end

 def post_params
  params.require(:post).permit(
    :title,
    :category_id,
    :body
    )
end

end
