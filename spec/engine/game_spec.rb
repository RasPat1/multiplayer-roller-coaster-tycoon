require 'rails_helper'

RSpec.describe Game do
  describe "Game can initialize" do
    it "exist" do
      expect(Game.new).not_to be_nil
    end

    it "has initial values" do
      game = Game.new

      expect(game.grid).not_to be_nil
      expect(game.money).not_to be_nil
    end
  end
  describe "can do stuff" do
    let(:game) { Game.new }
    let(:item_type) { :kiosk }

    it "can construct buildings" do
      Game.new.construct(0,0, :kiosk)
    end

    it "deducts money when construtin buildings" do
      start_money = game.money
      game.construct(0,0, item_type)
      end_money = game.money

      item = Item.new(item_type)
      expect(start_money - end_money).to eq(item.cost)
    end

    it "can raze buildings" do
      game.construct(0,0, item_type)
      expect(game.get(0,0)).not_to be_nil
      game.raze(0, 0)
      expect(game.get(0,0)).to be_nil
    end
  end

  describe "throws appropriate errors" do
    let(:game) { Game.new }
    let(:item_type) { :kiosk }

    it "cannot construct buildings if out of money" do
      game.money = 0
      expect{game.construct(0,0, item_type)}.to raise_error(Errors::NotEnoughMoneyError)
    end

    it "cannot construct buildings if already occupied" do
      build_item = Proc.new { game.construct(0,0, item_type) }
      build_item.call
      expect{build_item.call}.to raise_error(Errors::SpaceUnavailbleError)
    end

    it "cannot access outside grid" do
      invalid_accesses = [
        [-1, 0],
        [0, -1],
        [Game::WIDTH + 1, 0],
        [0, Game::LENGTH + 1]
      ]
      invalid_accesses.each do |location|
        expect{game.get(location[0], location[1])}.to raise_error(Errors::GridAccessOutOfBoundsError)
      end
    end
  end
end