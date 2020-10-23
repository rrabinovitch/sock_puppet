class RoomChannel < ApplicationCable::Channel
# subscribed and unsubscribed methods come out of the box
# these methods help us manage the connection and tells server what to do when client connects/disconnecs

  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel" # room_channel is the object on both the server side and client side
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # send information back
    ActionCable.server.broadcast("room_channel", message: data['message'])
  end
end
