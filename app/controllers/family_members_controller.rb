class FamilyMemberController < ApplicationController
  def index
    @family_members = @current_user.family_members.all
  end

  def new
  end

  def create
  end
end
