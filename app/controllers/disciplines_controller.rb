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
      redirect_to discipline_path(@discipline)
    else
      render :new
    end
  end

  def show
    @discipline = Discipline.find_by(id: params[:id])
  end

  def edit
    @discipline = Discipline.find_by(id: params[:id]
  end

  def update
    @discipline = Discipline.find_by_id(params[:id])

    if @discipline.update(discipline_params)
      redirect_to discipline_path(@discipline)
    else
      render :edit
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
