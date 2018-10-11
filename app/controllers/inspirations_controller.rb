class InspirationsController < ApplicationController
  def show
    @inspiration = Inspiration.find_by(id: params[:id])
  end
end
