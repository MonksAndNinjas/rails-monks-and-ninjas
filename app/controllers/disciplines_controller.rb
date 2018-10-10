class DisciplinesController < ApplicationController
  def index
    @disciplines = @current_user.disciplines
  end

  def new
    @discipline = @current_user.disciplines.build
  end

  def destroy
    delete(params[:id], Discipline, "disciplines")
  end
end
