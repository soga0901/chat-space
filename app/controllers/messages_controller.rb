class MessagesController < ApplicationController
  before_action :group_find
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index
      flash[:notice] = "メッセージの送信が完了しました。"
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def group_find
    @group = Group.find(params[:group_id])
  end
end

