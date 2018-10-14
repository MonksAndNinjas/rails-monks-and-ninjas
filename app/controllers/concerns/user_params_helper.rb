module UserParamsHelper
  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :password,

      family_members_attributes: [
        :id,
        :name,
        :birthdate,
        :relationship,
        :location,
        :contact,
        :relationship_status
      ],

      subscriptions_attributes: [
        :id,
        :name,
        :amount,
        :due_day
      ],

      priority_items_attributes: [
        :id,
        :title,
        :description
      ],

      disciplines_attributes: [
        :id,
        :title,
        :content,
        :duration
      ],

      inspirations_attributes: [
        :id,
        :source,
        :about,
        :image,
        :link,
        :video,
        :content
      ],

      quests_attributes: [
        :id,
        :title,
        :description,
        :objective_id
      ]
    )
  end
end
