class GroupsController < ApplicationController

  def create
    Group.create(name: group_params[:name])
  end

  private
  def group_params
    params.permit(:name)
  end
end
