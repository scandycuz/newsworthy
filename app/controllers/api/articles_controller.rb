class Api::ArticlesController < ApplicationController
  def index
    if params[:company_id]
      @articles = Article.where("company_id = ?", params[:company_id]).order(id: :asc).limit(20);
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if !@article.save
      render @article.errors.full_messages
    end
  end

  private
  def article_params
    params.require(:article)
    .permit(:title, :url, :company_id, :sentiment, :anger, :disgust, :fear, :joy, :sadness)
  end
end
