require 'rails_helper'

RSpec.describe 'heartbeat' do
  params = {
    game_id: 1,
    item: 'kiosk',
    position: '4,3'
  }

  describe "POST /item_manager" do

    it "returns a 200" do
      post grid_items_path

      expect(response).to have_http_status(200)
      # expect(json['alive']).to be true
    end
  end
end
