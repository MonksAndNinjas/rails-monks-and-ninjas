class DisciplinesController < ApplicationController
  def index
    @disciplines = @current_user.disciplines
  end

  def new
    @discipline = @current_user.disciplines.build
  end

  def create
    @discipline = @current_user.disciplines.build(discipline_params)

    render_new_or_redirect_if_saved(@discipline, "discplines")
  end

  def destroy
    delete(params[:id], Discipline, "disciplines")
  end

  private

  def discipline_params
    params.require(:discipline).permit(:title, :content, :duration)
  end
end
