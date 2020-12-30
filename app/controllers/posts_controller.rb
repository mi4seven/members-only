class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order("created_at DESC")
        @post = Post.new
    end

    def new
        @post = Post.new
    end


    #https://stackoverflow.com/questions/30825735/param-is-missing-or-the-value-is-empty-parametermissing-in-resultscontrollerup/30826895
    #https://stackoverflow.com/questions/11093848/rails-undefined-method-model-name-for-nilclassclass
    
    def create
        @post = Post.new(post_params)    
            
        if @post.save
            #redirect_to post_path(@post)
            redirect_to root_path notice: 'Post was successfully created.'    
        else
            render :new
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Post.find(params[:id])
    end    

    # Only allow a list of trusted parameters through.
    def post_params
        params.require(:post).permit(:title, :body)
    end      
end
