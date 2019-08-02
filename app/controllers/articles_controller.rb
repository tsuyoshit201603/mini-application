class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # binding pry
    Article.create(create_params)
    redirect_to action: 'index'
  end

  private
  def create_params
    params.require(:article).permit(:text)
  end
end
