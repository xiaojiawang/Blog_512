class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update]
  
  def index
    @articles=Article.all
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(article_params)
    @article.author=current_user.name
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destory
    if @article.destory
      redirect_to articles_path
    end
  end

  def guest
    @articles=Article.all
  end
private
  def article_params
    params.require(:article).permit(:title, :author, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end


end
