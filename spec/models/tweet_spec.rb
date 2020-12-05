require 'rails_helper'
describe Tweet do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿機能' do
    context '新規投稿がうまくいくとき' do
      it "titleとimageが存在すれば登録できる" do
        expect(@tweet).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it "titleが空だと投稿できない" do
        @tweet.title = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("投稿タイトルを入力してください")
      end
      it "imageが空だと登録できない" do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("投稿画像を入力してください")
      end
      it "ユーザーが紐付いていないと投稿は保存できない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end