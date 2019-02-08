class FamilyMembersController < ApplicationController

  def family_members_data
    family_member = FamilyMember.find(params[:id])
    render json: family_member, status: 200
  end
end
