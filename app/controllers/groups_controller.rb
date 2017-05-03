class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_groups, only: [:index]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループが作成されました。"
    else
      flash.now[:alert] = "グループを作成できませんでした。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = @group.users.where.not(id: current_user.id)
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集できました。"
    else
      flash[:alert] = "グループを編集できませんでした。"
      render :edit
    end
  end

  private
  def set_current_user_groups
    @groups = current_user.groups
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
