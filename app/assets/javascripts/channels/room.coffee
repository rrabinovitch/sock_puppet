# where we manage client side channel object
# out of box methods
  # connected: what happens on client when it connects
  # disconnected: what happens on the client when it disconnects
  # received: what happens when it receives data
  # this logic all lives on the client side

App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert(data['message_partial']) # this will make a pop up appear w the message content
    # append the message to the view's html
    $('#messages').append(data['message_partial'])

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (evrent) ->
  if event.keyCode is 13 #13 refers to return/enter key
    # access the message
    App.room.speak(event.target.value)
    # get form ready for a new message
    event.target.value = ''
    # we don't know what this thing is but megan says we need it
    event.preventDefault()
    #
