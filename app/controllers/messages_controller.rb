class MessagesController < ApplicationController
  # Creates a new message and broadcasts it to all channels in the chatroom.
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  # The message to send to the user. Returns a Hash of parameters that can be used in a POST
  def message_params
    params.require(:message).permit(:content)
  end
end
