require 'rails_helper'

RSpec.describe "pages controller", :type => :request do
  context "set_visitor_id" do
    it "creates a visitor record if a user visits the page for the first time" do
      visitor_count = Visitor.all.count
      get "/contact"
      expect(Visitor.all.count).to eq(visitor_count + 1)
    end

    it "sets a visitor id as an integer" do
      get "/contact"
      visitor_id = assigns(:visitor_id)
      expect(visitor_id.is_a?(Integer)).to eq(true)
    end
  end

  context "create_cookie" do
    it "creates a visit cookie" do
      get "/contact"
      cookie_test = assigns(:cookie_test)
      expect(cookie_test).to eq(true)
    end

    it "creates a visit record" do
      visit_count = Visit.all.count
      get "/contact"
      expect(Visit.all.count).to eq(visit_count + 1)
    end
  end

end
