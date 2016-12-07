class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:current_user_id]}"
    #stream_from "messages_#{params[:target_user_id]}"
  end

  def receive(data)
    ActionCable.server.broadcast("messages_#{params[:current_user_id]}", data)
    #ActionCable.server.broadcast("messages_#{params[:target_user_id]}", data)
  end
end