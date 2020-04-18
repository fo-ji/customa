require 'rails_helper'

describe ClientsController do

  describe 'GET #index' do

    before do
      user = create(:user)
      login user
    end

    it "@clientに正しい値が入っていること" do
      clients = create_list(:client, 3)
      get :index
      pending "current_userの一覧表示が上手く表現できない為、保留。"
      expect(assigns(:clients)).to match(clients)
    end

    it "@quotationに正しい値が入っていること" do
      quotations = create_list(:quotation, 3)
      get :index
      expect(assigns(:quotations)).to match(quotations)
    end

    it "@minuteに正しい値が入っていること" do
      minutes = create_list(:minute, 3)
      get :index
      expect(assigns(:minutes)).to match(minutes)
    end

    it "@otherに正しい値が入っていること" do
      others = create_list(:other, 3)
      get :index
      expect(assigns(:others)).to match(others)
    end
    
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do

    before do
      user = create(:user)
      login user
    end

    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    before do
      user = create(:user)
      login user
    end

    context "登録が成功した場合" do
      it 'クライアントが正しく登録されるか' do
        expect do
          post :create, params: { client: FactoryBot.attributes_for(:client) }
        end.to change(Client, :count).by(1)
      end

      it "登録後にroot_pathへ遷移するか" do
        client = create(:client)
        post :create, params: { client: FactoryBot.attributes_for(:client) }
        expect(response).to redirect_to root_path
      end
    end

    context "登録が失敗した場合" do
      it 'クライアントが正しく登録されないかどうか' do
        expect do
          post :create, params: { client: FactoryBot.attributes_for(:client, :invalid) }
        end.to_not change(Client, :count)
      end

      it "new.html.hamlへ遷移するか" do
        client = create(:client)
        post :create, params: { client: FactoryBot.attributes_for(:client, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
