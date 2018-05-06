class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # Used to test that server is up and running
  def heartbeat
    heartbeat = { alive: true }
    json_response(heartbeat)
  end
end
