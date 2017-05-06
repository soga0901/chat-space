class MessagesController < ApplicationController
  before_action :set_group, :set_messages, :set_current_user, :authenticate_user!

  def index
    @message = Message.new
    @groups = current_user.groups
    deference = @messages.last().id - params[:message_id].to_i if @messages
    @defferent_messages = @messages.last(deference)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージの送信が完了しました。"}
        format.json { render 'create', handlers: 'jbuilder' }
      end
    else
      flash.now[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: @group.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages
  end

  def set_current_user
    @user = current_user
  end

end
