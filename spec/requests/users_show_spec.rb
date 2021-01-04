require 'rails_helper'
describe UsersController, type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET users#show" do
    context "ログインしていない場合" do
      it "showアクションにリクエストするとユーザー詳細画面に遷移する" do 
        get user_path(@user)
        expect(response.status).to eq 200
      end
      it "showアクションにリクエストするとレスポンスにサービス名が存在する" do 
        get user_path(@user)
        expect(response.body).to include "Hanataba"
      end
      it "showアクションにリクエストするとレスポンスに投稿ページに遷移するリンクが存在する" do 
        get user_path(@user)
        expect(response.body).to include "投稿する"
      end
      it "showアクションにリクエストするとレスポンスにお店に行くリストに遷移するリンクが存在する" do 
        get user_path(@user)
        expect(response.body).to include "お店に行くリスト"
      end
      it "showアクションにリクエストするとレスポンスにお気に入りリストに遷移するリンクが存在する" do 
        get user_path(@user)
        expect(response.body).to include "お気に入り"
      end
      it "showアクションにリクエストするとレスポンスに通知を受け取るアイコンが存在する" do 
        get user_path(@user)
        expect(response.body).to include "fa-comment-alt"
      end
      it "showアクションにリクエストするとレスポンスにユーザーアイコンが存在する" do 
        get user_path(@user)
        expect(response.body).to include "fa-user"
      end
      # it "showアクションにリクエストするとレスポンスにユーザー画像が存在する" do 
      #   get user_path(@user)
      #   expect(response).to include @user.image
      # end
      it "showアクションにリクエストするとレスポンスにユーザーの名前が存在する" do 
        get user_path(@user)
        expect(response.body).to include @user.name
      end
      it "showアクションにリクエストするとレスポンスにフォローページへのリンクが存在する" do 
        get user_path(@user)
        expect(response.body).to include "フォロー"
      end
      it "showアクションにリクエストするとレスポンスにフォロワーページへのリンクが存在する" do 
        get user_path(@user)
        expect(response.body).to include "フォロワー"
      end
    end

    context "ログインしていて、かつ、投稿者だった場合" do
      it "showアクションにリクエストするとレスポンスにプロフィール編集ページへのリンクが存在する" do 
        sign_in @user 
        get user_path(@user)
        expect(response.body).to include "プロフィール編集"
      end
    end
  end
end