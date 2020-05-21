class CommentsController < ApplicationController
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  def show

  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if user_signed_in?
      @comment.destroy
    else
      @comment_pw = params[:comment_pw]
      if @comment.password == @comment_pw
        @comment.destroy
        message = "댓글이 삭제되었습니다."
        redirect_to @post, :notice => message

      else
        message = "비밀번호가 틀렸습니다."
        redirect_to @post, :alert => message

      end




    end
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :password)
  end
end
