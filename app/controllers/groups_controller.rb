class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/groups/#{@group.id}/messages", notice: "グループが作成されました。"
    else
      flash[:alert] = "グループを作成できませんでした。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to "/groups/#{@group.id}/messages", notice: "グループを編集できました。"
    else
      flash[:alert] = "グループを編集できませんでした。"
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
