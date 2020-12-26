require 'rails_helper'
describe UsersController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end

  describe "GET registrations#destroy" do
    subject { 
      sign_in @user
      delete user_registration_path
      expect(response.status).to eq 302
      expect(response).to redirect_to root_path
     }
    context "ログインしていて管理者ユーザーの場合" do
      it "destoryアクションにリクエストすると投稿一覧画面にリダイレクトされる" do
        sign_in @user
        delete user_registration_path
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
      it "destoryアクションにリクエストすると自分のアカウントを削除できる" do
        sign_in @user
        edit_user_registration_path
        expect {
          delete user_registration_path
        }.to change { User.count }.by(-1)
      end
      # it "ユーザーモデルに紐ずくツイートも削除されること" do
      #   sign_in @user
      #   edit_user_registration_path
      #   expect {
      #     delete user_registration_path
      #   }.to change { Tweet.count }.by(-1)
      # end
    end
    context "ログインしていない場合" do
      it "destroyアクションにリクエストするとログイン画面にリダイレクトされる" do
        delete user_registration_path
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
