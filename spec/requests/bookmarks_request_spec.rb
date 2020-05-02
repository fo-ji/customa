require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do

  describe "GET /toggle" do
    it "returns http success" do
      get "/bookmarks/toggle"
      expect(response).to have_http_status(:success)
    end
  end

end
