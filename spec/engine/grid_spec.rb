require 'rails_helper'

RSpec.describe Grid do
  describe "grid can initialize" do
    it "creates a 2d array" do
      expect(Grid.new(10, 10)).not_to be_nil
    end
  end
end