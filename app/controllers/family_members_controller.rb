class FamilyMembersController < ApplicationController
  def index
    @family_members = @current_user.family_members.all
  end

  def new
    @family_member = @current_user.family_members.build
  end
end
