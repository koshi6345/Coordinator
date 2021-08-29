class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
    end
    @room = @message.room
    @entries = @room.entries
    @messages = @room.messages
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :text, :room_id).merge(user_id: current_user.id)
  end

end
