class InspirationsController < ApplicationController

  def index
    @inspirations = @current_user.inspirations
  end

  def new
    @inspiration = @current_user.inspirations.build
  end

  def create
    @inspiration = @current_user.inspirations.build(inspiration_params)

    return render :new unless @inspiration.save

    redirect_to inspiration_path(@inspiration)
  end

  def show
    @inspiration = Inspiration.find_by(id: params[:id])
  end

  def edit
    @inspiration = Inspiration.find_by(id: params[:id])
  end

  def update
    @inspiration = Inspiration.find_by_id(params[:id])

    return render :edit unless @inspiration.update(inspiration_params)

    redirect_to inspiration_path(@inspiration )
  end

  def destroy
    Inspiration.find(params[:id]).destroy
    redirect_to inspirations_path
  end

  private

  def inspiration_params
    params.require(:inspiration).permit(:source, :about, :link, :image, :video, :content)
  end
end
