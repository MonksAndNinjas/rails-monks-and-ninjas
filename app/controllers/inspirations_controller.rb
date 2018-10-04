class InspirationsController < ApplicationController

  def index
    @inspirations = @current_user.inspirations
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
