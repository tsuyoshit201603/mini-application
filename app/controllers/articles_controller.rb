class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("id DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(create_params)
    redirect_to action: 'index'
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      redirect_to action: 'index'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(create_params)
      redirect_to action: 'index'
    end
  end

  private
  def create_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end
end
