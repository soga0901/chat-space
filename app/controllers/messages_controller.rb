class MessagesController < ApplicationController
  before_action :set_group, :set_messages, :authenticate_user!
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_url, notice: "メッセージの送信が完了しました。"
    else
      flash.now[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: @group)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages
  end

end

