class Api::CompaniesController < ApplicationController
  def index
    if params[:slug]
      @company = Company.find_by_slug(params[:slug])
      render :show
    else
      @companies = Company.all.order(:id)
    end
  end

  def show
    @company = Company.find(params[:id])
  end
end
