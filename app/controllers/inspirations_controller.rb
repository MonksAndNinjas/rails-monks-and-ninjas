class InspirationsController < ApplicationController

  def inspirations_data
    inspiration = Inspiration.find(params[:id])
    render json: inspiration, status: 200
  end
end
