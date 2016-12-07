class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)
    meeting = Meeting.find(params[:meeting_id])
    @message.meeting = meeting
    target_user = current_user.get_target_user(meeting.knocker_id, meeting.knockee_id)
    if @message.save
      ActionCable.server.broadcast("messages_#{target_user}",
                                   ApplicationController.render(partial: 'messages/message', locals: { message: @message }))
    end
  end

  private
  def message_params
    params.require(:message).permit!
  end
end