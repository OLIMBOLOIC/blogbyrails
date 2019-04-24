class CommentairesController < ApplicationController
    def create
       @post = Post.find(params[:post_id])
       @commentaire = @post.commentaires.create(params[:commentaire].permit(:nom, :commentaire))
       redirect_to post_path(@post)
    end
    def destroy
        @post = Post.find(params[:post_id])
        @commentaire = @post.commentaires.find(params[:id])
        @commentaire.destroy

        redirect_to post_path(@post)
    end
end
