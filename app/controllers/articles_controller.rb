class ArticlesController < ApplicationController

    before_action :find_article, except: [:new, :create, :index, :from_author]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]
    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.create(strong_params)
        redirect_to @article
    end

    def update
        @article.update(strong_params)
        redirect_to @article
    end

    def edit
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def strong_params
        params.require(:article).permit(:title,:content)
    end

end
