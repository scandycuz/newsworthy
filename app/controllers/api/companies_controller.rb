class Api::CompaniesController < ApplicationController
  def index
    if params[:slug]
      @company = Company.includes(:articles).find_by_slug(params[:slug])
      render :show
    else
      @companies = Company
      .where.not(sentiment: 0.0, anger: 0.0, disgust: 0.0, fear: 0.0, joy: 0.0, sadness: 0.0)
      .order(:id)
    end
  end

  def show
    @company = Company.find(params[:id])
  end
end
