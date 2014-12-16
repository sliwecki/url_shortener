require 'rails_helper'

describe HomeController, type: :routing do
  describe "routing" do
    it "routes to root" do
      expect(get: '/').to route_to('home#new')
    end

    it "routes to #new" do
      expect(get: '/home/new').to route_to('home#new')
    end

    it "routes to #create" do
      expect(post: '/home').to route_to('home#create')
    end
  end
end
