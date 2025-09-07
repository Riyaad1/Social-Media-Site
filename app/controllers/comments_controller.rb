class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: "comment_create_form", locals: { comment: @comment }) }
        format.html { render :show, status: :unprocessable_content }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.expect(comment: [ :content ])
  end
end
