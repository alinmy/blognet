class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
 def index
 @post=User.all 
 @post = Post.all		

 	end	

 def new
 	@post= Post.new	
 	end

  def show
  	@post=Post.find(params[:id])	
  	end	
  	
  	def edit
      @post=Post.find(params[:id])

      #if @post.user==current_user
  	#else
        redirect_to @post
     #end
   end
  def create
  	@post=Post.new(post_params)
    #@post.user_id = current_user.id
    #if (@post.save)
  	redirect_to @post
  #else
  	render 'new'
  #end
  end

  def update
  	@post = Post.find(params[:id])
    
    if (@post.update(post_params))
  	redirect_to @post
  else
  	render 'edit'
  end
   end

   def destroy
    @post = Post.find(params[:id]) 
    #if @post.user==current_user  
     @post.destroy
    redirect_to posts_path
  #else
    #redirect_to @post
   #end
 end
  

  private
   def post_params

  	params.require(:post).permit(:title, :body, :image)
  	
 end
end

