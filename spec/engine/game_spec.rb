require 'rails_helper'

RSpec.describe Game do
  describe "Game can initialize" do
    it "exist" do
      expect(Game.new).not_to be_nil
    end

    it "have initial values" do
      game = Game.new

      expect(game.grid).not_to be_nil
      expect(game.money).not_to be_nil
    end
  end
end