class QuestsController < ApplicationController
  def new
    @quest = @current_user.quests.build
    @objective = Objective.find_by(id: params[:objective_id])
  end

  def create
    @quest = @current_user.quests.build(quest_params)
    @objective = Objective.find_by(id: params[:objective_id])

    return render :new unless @quest.save

    redirect_to objectives_path
  end

  def edit
    @quest = @current_user.quests.find_by_id(params[:id])
    @objective = Objective.find_by(id: params[:objective_id])
  end

  def update
    @quest = @current_user.quests.find_by_id(params[:id])
    @objective = Objective.find_by(id: params[:objective_id])

    return render :edit unless @quest.update(quest_params)

    redirect_to objectives_path
  end

  def destroy
    Quest.find(params[:id]).destroy
    redirect_to objectives_path
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :objective_id, :title, :description)
  end
end
