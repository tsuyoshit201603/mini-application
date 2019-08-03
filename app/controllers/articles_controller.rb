class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("id DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: 'index'
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
    redirect_to action: 'index'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params) if article.user_id == current_user.id
    redirect_to action: 'index'
  end

  private
  
  def article_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end
end
