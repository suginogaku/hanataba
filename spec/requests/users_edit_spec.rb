require 'rails_helper'
describe UsersController, type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET registrations#edit" do
    context "ログインしているユーザーの場合" do
      it "editアクションにリクエストするとユーザー編集ページに遷移する" do
        sign_in @user 
        get edit_user_registration_path
        expect(response.status).to eq 200
      end
      it "editアクションにリクエストするとレスポンスにサービス名が存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "Hanataba"
      end
      it "editアクションにリクエストするとレスポンスに投稿ページに遷移するリンクが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "投稿する"
      end
      # 以下追加実装
      it "editアクションにリクエストするとレスポンスにお店に行くリストに遷移するリンクが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "お店に行くリスト"
      end
      it "editアクションにリクエストするとレスポンスにお気に入りリストに遷移するリンクが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "お気に入り"
      end
      it "editアクションにリクエストするとレスポンスに通知を受け取るアイコンが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "fa-comment-alt"
      end
      # 以上追加実装
      it "editアクションにリクエストするとレスポンスにユーザーアイコンが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "fa-user"
      end
      it "editアクションにリクエストするとレスポンスに画像アップロードフォームが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "画像をアップロード"
      end
      it "editアクションにリクエストするとレスポンスにユーザー名入力フォームが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include @user.name
      end
      it "editアクションにリクエストするとレスポンスにメールアドレス入力フォームが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include @user.email
      end
      it "editアクションにリクエストするとレスポンスにパスワード入力フォームが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "パスワード"
      end
      it "editアクションにリクエストするとレスポンスに確認用パスワード入力フォームが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "パスワード（確認用）"
      end
      it "editアクションにリクエストするとレスポンスに自己紹介入力フォームが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "自己紹介文"
      end
      it "editアクションにリクエストするとレスポンスに更新ボタンが存在する" do 
        sign_in @user 
        get edit_user_registration_path
        expect(response.body).to include "更新"
      end
    end
    context "ログインしていないユーザーの場合" do
      it "ログイン画面にリダイレクトされる" do
        get edit_user_registration_path
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end