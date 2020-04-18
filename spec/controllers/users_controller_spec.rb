require 'rails_helper'

describe UsersController do

  describe 'GET #edit' do
    it "edit.html.hamlに遷移すること" do
      user = create(:user)
      login user
      get :edit, params: { nickname: user, email: user, id: user }
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do

    context "更新が成功した場合" do
      it "root_pathへリダイレクトすること" do
        user = create(:user)
        login user
        put :update, params: { id: user, user: FactoryBot.attributes_for(:another_user) }
        expect(response).to redirect_to root_path
      end
    end

    context "更新が失敗した場合" do
      it "edit.html.hamlに遷移すること" do
        user = create(:user)
        login user
        put :update, params: { id: user, user: FactoryBot.attributes_for(:error_user) }
        expect(response).to render_template :edit
      end
    end
  end
end
