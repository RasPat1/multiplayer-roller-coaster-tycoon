Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/heartbeat' => 'application#heartbeat', :as => :heartbeat
  
  get '*path', to: 'application#fallback_index_html',
               constraints: ->(req) do
                 !req.xhr? && req.format.html?
               end
end
