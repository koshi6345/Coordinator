class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      if @message = Message.create(message_params)
        @room = @message.room
        if @message.save
          @roommembernotme = Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
          @theid = @roommembernotme.find_by(room_id: @room.id)
          notification = current_user.active_notifications.new(
            room_id: @room.id,
            message_id: @message.id,
            visited_id: @theid.user_id,
            visitor_id: current_user.id,
            action: 'dm'
          )
          if notification.visitor_id == notification.visited_id
            notification.checked = true
          end

          notification.save if notification.valid?
        end
        @entries = @room.entries
        @messages = @room.messages
        @message = Message.new
      else
        render 'room'
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :text, :room_id).merge(user_id: current_user.id)
  end

end
