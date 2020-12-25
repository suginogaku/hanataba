require 'rails_helper'
describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
    @user = FactoryBot.create(:user)
  end

  describe "GET tweets#destroy" do
    context "管理者ユーザーの場合" do
      it "destroyアクションにリクエストするとトップページにリダイレクトされる" do 
        sign_in @tweet.user
        delete tweet_path(@tweet)
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
      it "destroyアクションにリクエストすると自分の投稿を削除できる" do
        sign_in @tweet.user
        expect {
          delete tweet_path(@tweet)
        }.to change { Tweet.count }.by(-1)
      end
    end

    context "管理者ユーザーではない場合" do
      it "destroyアクションにリクエストするとトップページにリダイレクトされる" do 
        sign_in @user
        delete tweet_path(@tweet)
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
      end
      it "destroyアクションにリクエストしても他人の投稿を削除できない" do
        sign_in @user
        expect {
          delete tweet_path(@tweet)
        }.to_not change { Tweet.count }
      end
    end

    context "ログインしていない場合" do
      it "destroyアクションにリクエストするとログインページにリダイレクトされる" do 
        delete tweet_path(@tweet)
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
