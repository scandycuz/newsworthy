class Api::DatapointsController < ApplicationController
  def create
    @datapoint = Datapoint.new(datapoint_params)

    if !@datapoint.save
      render @datapoint.errors.full_messages
    end
  end

  private
  def datapoint_params
    params.require(:article)
    .permit(:company_id, :article_id, :sentiment, :anger, :disgust, :fear, :joy, :sadness)
  end
end
