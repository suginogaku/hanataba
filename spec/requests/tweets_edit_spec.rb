require 'rails_helper'
describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
    @user = FactoryBot.create(:user)
  end

  describe "GET tweets#edit" do
    context "管理者ユーザーの場合" do
      it "editアクションにリクエストすると正常にレスポンスが返ってくる" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.status).to eq 200
      end
      it "editアクションにリクエストするとレスポンスにサービス名が存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "Hanataba"
      end
      it "editアクションにリクエストするとレスポンスに投稿ページに遷移するリンクが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "投稿する"
      end
      # 以下追加実装
      it "editアクションにリクエストするとレスポンスにお店に行くリストに遷移するリンクが存在する" do
        sign_in @tweet.user 
        get edit_tweet_path(@tweet)
        expect(response.body).to include "お店に行くリスト"
      end
      it "editアクションにリクエストするとレスポンスにお気に入りリストに遷移するリンクが存在する" do
        sign_in @tweet.user 
        get edit_tweet_path(@tweet)
        expect(response.body).to include "お気に入り"
      end
      it "editアクションにリクエストするとレスポンスに通知を受け取るアイコンが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "fa-comment-alt"
      end
      # 以上追加実装
      it "editアクションにリクエストするとレスポンスにユーザーアイコンが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "fa-user"
      end
      it "editアクションにリクエストするとレスポンスに画像アップロードフォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "画像をアップロード"
      end
      it "editアクションにリクエストするとレスポンスに投稿タイトル編集フォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "投稿タイトル"
      end
      it "editアクションにリクエストするとレスポンスに説明編集フォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "説明"
      end
      it "editアクションにリクエストするとレスポンスに花の名前編集フォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "花の名前"
      end
      it "editアクションにリクエストするとレスポンスに購入した市町村編集フォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "購入した市町村"
      end
      it "editアクションにリクエストするとレスポンスに購入した店の名前編集フォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "購入した店の名前"
      end
      it "editアクションにリクエストするとレスポンスにおすすめ度編集フォームが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "おすすめ度"
      end
      it "editアクションにリクエストするとレスポンスに更新ボタンが存在する" do 
        sign_in @tweet.user
        get edit_tweet_path(@tweet)
        expect(response.body).to include "更新"
      end
    end

    context "管理者ユーザーではない場合" do
      it "editアクションにリクエストするとトップページにリダイレクトされる" do 
        sign_in @user
        get edit_tweet_path(@tweet)
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
    end

    context "ログインしていない場合" do
      it "editアクションにリクエストするとログインページにリダイレクトされる" do 
        get edit_tweet_path(@tweet)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
