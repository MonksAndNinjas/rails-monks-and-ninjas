class DisciplinesController < ApplicationController

  def disciplines_data
    discipline = Discipline.find(params[:id])
    render json: discipline, status: 200
  end
end
