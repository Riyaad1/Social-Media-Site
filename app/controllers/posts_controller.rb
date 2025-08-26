class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post Successfully Created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Product.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Product.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.expect(post: [ :content ])
  end
end
