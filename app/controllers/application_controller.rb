class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # Used to test that server is up and running
  def heartbeat
    heartbeat = { alive: true }
    json_response(heartbeat)
  end

  def fallback_index_html
    respond_to do |format|
      format.html { render body: Rails.root.join('public/index.html').read }
    end
  end
end
