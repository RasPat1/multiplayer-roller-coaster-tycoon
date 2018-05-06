require 'rails_helper'

RSpec.describe 'heartbeat' do
  describe "GET /hearbeat" do
    it "Returns a 200" do
      get heartbeat_path
      expect(response).to have_http_status(200)
      expect(json['alive']).to be true
    end
  end
end