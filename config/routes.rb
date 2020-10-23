Rails.application.routes.draw do
  root to: 'rooms#show'

  # tells route handler that if a request comes in looking for a websocket, do not reject it
  mount ActionCable.server => "/cable"
  
end
