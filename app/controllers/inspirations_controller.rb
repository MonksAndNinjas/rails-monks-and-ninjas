class InspirationsController < ApplicationController
  def index
    @inspirations = @current_user.inspirations
  end

  def new
    @inspiration = @current_user.inspirations.build
  end

  def create
    @inspiration = @current_user.inspirations.build(inspiration_params)

    render_new_or_redirect_if_saved(@inspiration, "inspirations")
  end

  def show
    @inspiration = Inspiration.find_by(id: params[:id])
  end

  def edit
    @inspiration = Inspiration.find_by(id: params[:id])
  end

  def update
    @inspiration = Inspiration.find_by_id(params[:id])

    render_edit_or_redirect_if_updated(@inspiration, inspiration_params, "inspirations")
  end

  def destroy
    delete(params[:id], Inspiration, "inspirations")
  end

  private

  def inspiration_params
    params.require(:inspiration).permit(:source, :about, :link, :image, :video, :content)
  end
end
