class InspirationsController < ApplicationController

  def index
    @inspirations = @current_user.inspirations
  end

  def new
    @inspiration = @current_user.inspirations.build
  end

  def create
    @inspiration = @current_user.inspirations.build(inspiration_params)

    if @inspiration.save
      redirect_to inspirations_path
    else
      render :new
    end
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
