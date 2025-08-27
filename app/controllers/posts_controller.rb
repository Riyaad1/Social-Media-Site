class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "post_create_form", locals: { post: @post }) }
        format.html { render :index, status: :unprocessable_content }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.expect(post: [ :content ])
  end
end
