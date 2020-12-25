require 'rails_helper'
describe UsersController, type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET sessions#new" do
    context "ログインしている場合" do
      it "newアクションにリクエストすると投稿一覧画面にリダイレクトされる" do
        sign_in @user
        get new_user_session_path
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
    end
    context "ログインしていない場合" do
      it "newアクションにリクエストするとログイン画面に遷移する" do
        get new_user_session_path
        expect(response.status).to eq 200
      end
      it "newアクションにリクエストするとレスポンスにサービス名が存在する" do 
        get new_user_session_path
        expect(response.body).to include "Hanataba"
      end
      it "newアクションにリクエストするとサービス紹介ページに遷移するリンクが存在する" do 
        get new_user_session_path
        expect(response.body).to include "Hanatabaについて"
      end
      it "newアクションにリクエストするとレスポンスにログインページに遷移するリンクが存在する" do 
        get new_user_session_path
        expect(response.body).to include "ログイン"
      end
      it "newアクションにリクエストするとレスポンスに新規登録画面に遷移するリンクが存在する" do 
        get new_user_session_path
        expect(response.body).to include "新規登録"
      end
      it "newアクションにリクエストするとレスポンスにメールアドレスの入力フォームが存在する" do 
        get new_user_session_path
        expect(response.body).to include "メールアドレス"
      end
      it "newアクションにリクエストするとレスポンスにパスワードの入力フォームが存在する" do 
        get new_user_session_path
        expect(response.body).to include "パスワード"
      end
      it "newアクションにリクエストするとレスポンスにログインボタンが存在する" do 
        get new_user_session_path
        expect(response.body).to include "Log in"
      end
    end
  end
end