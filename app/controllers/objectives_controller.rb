class ObjectivesController < ApplicationController

  def index
    @objectives = Objective.all
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.new(objetive_params)

    if @objective.save
      redirect_to objectives_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
