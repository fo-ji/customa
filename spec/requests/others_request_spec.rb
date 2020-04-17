require 'rails_helper'

RSpec.describe "Others", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/others/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/others/create"
      expect(response).to have_http_status(:success)
    end
  end

end
