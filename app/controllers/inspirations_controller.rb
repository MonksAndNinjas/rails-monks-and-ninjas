class InspirationsController < ApplicationController
  def index
    @inspirations = @current_user.inspirations
  end

  def new
    @inspiration = @current_user.inspirations.build
  end

  def show
    @inspiration = Inspiration.find_by(id: params[:id])
  end

  def edit
    @inspiration = Inspiration.find_by(id: params[:id])
  end

  def destroy
    delete(params[:id], Inspiration, "inspirations")
  end
end
