class PostsController < ApplicationController
    before_action :find_post, only:[:show, :edit, :destoy, :update]
    before_action :authenticate_utilisateur!, except:[:index, :show]
    def index
        @posts = Post.all.order('created_at DESC')
    end
    def new
        @post = current_utilisateur.posts.build
    end
    def show
  
    end
    def create
        @post = current_utilisateur.posts.build(post_params)
        if @post.save
        redirect_to @post
        else
            render 'new'
        end
    end
    def destroy
        
        @post.destroy

        redirect_to root_path
    end
    def edit

    end
    def update
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
        params.require(:post).permit(:titre, :contenu, :utilisateur_id)

    end
end
