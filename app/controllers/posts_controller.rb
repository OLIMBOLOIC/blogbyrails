class PostsController < ApplicationController
    before_action :find_post, only:[:show, :edit, :destoy, :update]
    # before_action :authenticate_utilisateur!, except:[:index, :show, :create]
    def index
        @posts = Post.all.order('created_at DESC')
    end
    def new
        @post = Post.new
    end
    def show
        @post = Post.friendly.find(params[:id])
    end
    def create
        @post = Post.friendly.new(post_params)
        if @post.save
        redirect_to @post
        else
          render 'new'  
        end
    end
    def destroy
        @post = Post.friendly.find(params[:id])
        @post.destroy
        redirect_to root_path
    end
    def edit
        @post = Post.friendly.find(params[:id])
    end
    def update
        @post = Post.friendly.find(params[:id])
        if  @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    private 
    def find_post
        @post = Post.friendly.find(params[:id])
    end
    def post_params
        params.require(:post).permit(:titre, :contenu)# :image)
    end
end
