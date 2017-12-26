require "rails_helper"


RSpec.describe CoinsController, type: :routing do
  describe "routing" do
    
    it "routes to #index" do
      expect(:get => "collections/1/coins").to route_to("coins#index", :collection_id => "1")
    end

    it "routes to #new" do
      expect(:get => "collections/1/coins/new").to route_to("coins#new", :collection_id => "1")
    end

    it "routes to #show" do
      expect(:get => "collections/1/coins/1").to route_to("coins#show", :id => "1", :collection_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "collections/1/coins/1/edit").to route_to("coins#edit", :id => "1", :collection_id => "1")
    end

    it "routes to #create" do
      expect(:post => "collections/1/coins").to route_to("coins#create", :collection_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "collections/1/coins/1").to route_to("coins#update", :id => "1", :collection_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "collections/1/coins/1").to route_to("coins#update", :id => "1", :collection_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "collections/1/coins/1").to route_to("coins#destroy", :id => "1", :collection_id => "1")
    end
  end
end