class Api::ArticlesController < ApplicationController
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
