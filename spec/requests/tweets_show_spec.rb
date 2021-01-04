require 'rails_helper'
describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
    @user = FactoryBot.create(:user)
  end

  describe "GET tweets#show" do
    context "管理者ユーザーじゃない場合" do
      it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get tweet_path(@tweet)
        expect(response.status).to eq 200
      end
      it "showアクションにリクエストするとレスポンスにサービス名が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "Hanataba"
      end
      it "showアクションにリクエストするとレスポンスに投稿ページに遷移するリンクが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "投稿する"
      end
      it "showアクションにリクエストするとレスポンスにお店に行くリストに遷移するリンクが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "お店に行くリスト"
      end
      it "showアクションにリクエストするとレスポンスにお気に入りリストに遷移するリンクが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "お気に入り"
      end
      it "showアクションにリクエストするとレスポンスに通知を受け取るアイコンが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "fa-comment-alt"
      end
      it "showアクションにリクエストするとレスポンスにユーザーアイコンが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "fa-user"
      end
      it "showアクションにリクエストするとレスポンスに投稿済みのツイートのタイトルが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include @tweet.title
      end
      # activestorageを用いている為、imageカラムが存在しないエラーが発生する。activestorageとactivehashを紐付ける記述が必要
      # it "showアクションにリクエストするとレスポンスに投稿済みのツイートの画像が存在する" do 
      #   get root_path
      #   expect(response.body).to include @tweet.image
      # end
      it "showアクションにリクエストするとレスポンスに投稿日時が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "投稿日時"
      end
      it "showアクションにリクエストするとレスポンスにツイートのテキストが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include @tweet.description
      end
      it "showアクションにリクエストするとレスポンスにツイートのおすすめ度が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "おすすめ度"
      end
      it "showアクションにリクエストするとレスポンスにツイートの花の名前が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include @tweet.flower_name
      end
      it "showアクションにリクエストするとレスポンスにツイートの県名が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "県名"
      end
      it "showアクションにリクエストするとレスポンスにツイートの市町村が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include @tweet.city
      end
      it "showアクションにリクエストするとレスポンスにツイートの店の名前が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include @tweet.shop_name
      end
      it "showアクションにリクエストするとレスポンスにログのフォームが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "ログを追加する"
      end
      it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "＜コメント一覧＞"
      end
      it "showアクションにリクエストするとレスポンスに詳細ボタンが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "詳細"
      end
      it "showアクションにリクエストするとレスポンスにユーザー詳細に遷移するボタンが存在する" do 
        get tweet_path(@tweet)
        expect(response.body).to include "by"
      end
    end

    context "管理者ユーザーの場合" do
      it "showアクションにリクエストするとレスポンスにコメントフォームが存在する" do 
        sign_in @tweet.user
        get tweet_path(@tweet)
        expect(response.body).to include "コメントする"
      end
      it "showアクションにリクエストするとレスポンスに編集ボタンが存在する" do 
        sign_in @tweet.user
        get tweet_path(@tweet)
        expect(response.body).to include "編集"
      end
      it "indexアクションにリクエストするとレスポンスに削除が存在する" do 
        sign_in @tweet.user
        get tweet_path(@tweet)
        expect(response.body).to include "削除"
      end
    end
  end
end
