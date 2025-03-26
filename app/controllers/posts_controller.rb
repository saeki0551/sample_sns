class PostsController < ApplicationController

    def index
        @posts = Post.all.order(updated_at: :desc)
    end

    def new
        @post = Post.new #空のインスタンスを生成
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to action: 'index' 
        else
            redirect_to action: 'new' 
        end
    end

    private
    def post_params #ストロングパラメータ
        params.require(:post).permit(:title, :content) #パラメーターのキー
    end
end
