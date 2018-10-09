class QuestsController < ApplicationController
  helper_method :build_quest
  helper_method :find_quest

  def new
    build_quest(objective_id: params[:objective_id])
  end

  def create#don't know if need
    build_quest(quest_params, params[:objective_id])

    render_new_or_redirect_if_saved(@quest, "objectives")
  end

  def edit#don't need
    find_quest_info(params[:id], params[:objective_id])
  end

  def update#don't need
    find_quest_info(params[:id], params[:objective_id])

    render_edit_or_redirect_if_updated(@quest, quest_params, "objectives")
  end

  def destroy
    delete(params[:id], Quest, "objectives")
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :objective_id, :title, :description)
  end
end
