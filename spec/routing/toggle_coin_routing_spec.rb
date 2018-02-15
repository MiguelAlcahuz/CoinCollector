require "rails_helper"

RSpec.describe Collection::ToggleCoinsController, type: :routing do
  describe "routing" do

    it "routes to #update via PUT" do
      expect(:put => "/collections/1/toggle_coins/2").to route_to("collection/toggle_coins#update", :id => "1", :toggle_coin_id => "2")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/collections/1/toggle_coins/2").to route_to("collection/toggle_coins#update", :id => "1", :toggle_coin_id => "2")
    end

    it "routes to #destroy" do
      expect(:delete => "/collections/1/toggle_coins/2").to route_to("collection/toggle_coins#destroy", :id => "1",:toggle_coin_id => "2")
    end
  end
end