class Api::ArticlesController < ApplicationController
  def create

  end

  private
  def article_params
    params.require(:article)
    .permit(:title, :url, :company_id, :sentiment, :anger, :disgust, :fear, :joy, :sadness)
