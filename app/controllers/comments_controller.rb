class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def create
	@post=Post.find(params[:post_id])	
	@comment = @post.comments.new(comment_params.merge(user_id: current_user.id))
  
  if @comment.save
   redirect_to post_path(@post)
  else
    render :new
  end
   end
	def destroy
  @post = Post.find(params[:post_id])
  @post.comments.find(params[:id]).destroy
  redirect_to post_path(@post)
end

def update
@post = Post.find(params[:post_id])
@comment = @post.comments.find(params[:id])

if (@comment.update(comment_params))
redirect_to post_path(@post)
else
render 'edit'
end
end


  def edit
 @post = Post.find(params[:post_id]) 
  @comment = @post.comments.find(params[:id])
  end 


	private def comment_params 
	 params.require(:comment).permit(:username, :body, :image)	
end
end
