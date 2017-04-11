class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to messages_url, notice: "グループが作成されました。"
    else
      flash[:alert] = "グループを作成できませんでした。"
      render :new
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
