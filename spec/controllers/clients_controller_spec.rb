require 'rails_helper'

describe ClientsController do

  describe 'GET #index' do
    it "@clientに正しい値が入っていること" do
      clients = create_list(:client, 3) 
      get :index
      expect(assigns(:clients)).to match(clients)
    end

    it "index.html.erbに遷移すること" do
    end
  end

end