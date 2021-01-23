class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order("created_at DESC")
        @post = Post.new
    end

    def new
        @post = current_user.posts.build
    end
    
    def create
        @post = current_user.posts.build(post_params)    
            
        if @post.save
            redirect_to root_path #notice: 'Post was successfully created.'    
            flash.notice = "Post '#{@post.title}' Created!" 
        else
            render :new
        end
    end

    def edit            

    end
      
    def update            
        if @post.update(post_params)
            redirect_to root_path #notice: 'Post was successfully updated.'   
            flash.notice = "Post '#{@post.title}' Updated!" 
        else
            render :edit
        end
    end

    def destroy  
        @post.destroy
        redirect_to root_path notice: 'Post was successfully deleted.'    
    end

    private
    def set_post
        @post = Post.find(params[:id])
    end    

    # Only allow a list of trusted parameters through.
    def post_params
        params.require(:post).permit(:title, :body)
    end      
end
