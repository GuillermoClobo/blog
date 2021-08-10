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
        @categories = Category.all
    end

    def create
        @article = current_user.articles.create(strong_params)
        @article.save_categories
        redirect_to @article
    end

    def update
        @article.update(strong_params)
        @article.save_categories
        redirect_to @article
    end

    def edit
        @categories = Category.all
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
        params.require(:article).permit(:title,:content, category_elements: [])
    end

end
