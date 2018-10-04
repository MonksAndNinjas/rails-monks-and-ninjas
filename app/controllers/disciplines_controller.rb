class DisciplinesController < ApplicationController

  def index
    @disciplines = @current_user.disciplines
  end

  def new
    @discipline = @current_user.disciplines.build
  end

  def create
    @discipline = @current_user.disciplines.build(discipline_params)

    if @discipline.save
      redirect_to disciplines_path
    else
      render :new
    end
  end

  def destroy
    Discipline.find(params[:id]).destroy
    redirect_to disciplines_path
  end

  private

  def discipline_params
    params.require(:discipline).permit(:title, :content, :duration)
  end
end
