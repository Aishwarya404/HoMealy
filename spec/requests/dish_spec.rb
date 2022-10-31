require 'rails_helper'
require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Dishes", type: :request do
  describe "GET /dishes/new" do
    it "returns http success" do
      get "/dishes/new"
      expect(response).to render_template("layouts/application")
      expect(response).to have_http_status(:success)
    end
  end
end