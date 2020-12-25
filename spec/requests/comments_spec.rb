require 'rails_helper'
describe TweetsController, type: :request do

  before do
    @tweet = FactoryBot.create(:tweet)
    @user = FactoryBot.create(:user)
    @comment = FactoryBot.create(:comment)
  end

  # describe "GET comments#create" do
  #   context "ログインしている場合" do
  #     # パラメーターの紐付け紐付け方が分からない
  #     it "有効な内容のコメントが登録できること" do
  #       sign_in @user
  #       expect {
  #         post tweet_comments_path(@tweet), params: {
  #         }
  #       }.to change { Comment.count }.by(1)
  #     end
  #     it "無効な内容のコメントが登録できないこと" do
  #     end
  #   end

  #   context "ログインしていない場合" do
  #     it "コメントが登録できないこと" do
  #     end
  #     it "投稿詳細ページにリダイレクトされること" do
  #     end
  #   end
  # end
end
