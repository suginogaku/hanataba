require 'rails_helper'
describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
    @user = FactoryBot.create(:user)
  end

  describe "GET tweets#index" do
    context "管理者ユーザーじゃない場合" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する" do 
        get root_path
        expect(response.body).to include "投稿を検索する"
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みのツイートのタイトルが存在する" do 
        get root_path
        expect(response.body).to include @tweet.title
      end
      # activestorageを用いている為、imageカラムが存在しないエラーが発生する。activestorageとactivehashを紐付ける記述が必要
      # fixture_file_uploadを使用する？
      # it "indexアクションにリクエストするとレスポンスに投稿済みのツイートの画像が存在する" do 
      #   get root_path
      #   expect(response.body).to have_selector ".tweet-image[src='(#{@tweet_image});']"
      # end
      it "indexアクションにリクエストするとレスポンスにお気に入りに追加するボタンが存在する" do 
        get root_path
        expect(response.body).to include "お気に入りに追加する"
      end
      it "indexアクションにリクエストするとレスポンスにお店に行くリストボタンが存在する" do 
        get root_path
        expect(response.body).to include "お店に行くリストに追加する"
      end
      it "indexアクションにリクエストするとレスポンスに投稿日時が存在する" do 
        get root_path
        expect(response.body).to include "投稿日時"
      end
      it "indexアクションにリクエストするとレスポンスにツイートのテキストが存在する" do 
        get root_path
        expect(response.body).to include @tweet.description
      end
      it "indexアクションにリクエストするとレスポンスにツイートのおすすめ度が存在する" do 
        get root_path
        expect(response.body).to include "おすすめ度"
      end
      it "indexアクションにリクエストするとレスポンスにツイートの花の名前が存在する" do 
        get root_path
        expect(response.body).to include @tweet.flower_name
      end
      it "indexアクションにリクエストするとレスポンスにツイートの県名が存在する" do 
        get root_path
        expect(response.body).to include "県名"
      end
      it "indexアクションにリクエストするとレスポンスにツイートの市町村が存在する" do 
        get root_path
        expect(response.body).to include @tweet.city
      end
      it "indexアクションにリクエストするとレスポンスにツイートの店の名前が存在する" do 
        get root_path
        expect(response.body).to include @tweet.shop_name
      end
      it "indexアクションにリクエストするとレスポンスにログのフォームが存在する" do 
        get root_path
        expect(response.body).to include "ログを追加する"
      end
      it "indexアクションにリクエストするとレスポンスに詳細ボタンが存在する" do 
        get root_path
        expect(response.body).to include "詳細"
      end

      it "indexアクションにリクエストするとレスポンスにユーザー詳細に遷移するボタンが存在する" do 
        get root_path
        expect(response.body).to include "by"
      end
    end

    context "管理者ユーザーの場合" do
      it "indexアクションにリクエストするとレスポンスに編集ボタンが存在する" do 
        sign_in @tweet.user
        get root_path
        expect(response.body).to include "編集"
      end
      it "indexアクションにリクエストするとレスポンスに削除が存在する" do 
        sign_in @tweet.user
        get root_path
        expect(response.body).to include "削除"
      end
    end
  end
end
