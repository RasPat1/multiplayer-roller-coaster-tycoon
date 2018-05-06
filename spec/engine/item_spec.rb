require 'rails_helper'

RSpec.describe Item do
  describe "can initialize" do
    it "allows you to create registered item types" do
      item = Item.new(:kiosk)
      expect(item).to be_kind_of(Item)
      expect(item.cost).to eq 1000
      expect(item.name).to eq "Kiosk"
    end
    it "does not allow you to create fake types" do
      expect{Item.new(:faker)}.to raise_error(Errors::TypeNotRegisteredError)
    end
  end
end