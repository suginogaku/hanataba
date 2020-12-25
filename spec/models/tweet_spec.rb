require 'rails_helper'
describe Tweet do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿機能' do
    context '新規投稿がうまくいくとき' do
      it "タイトルと画像が存在すれば登録できる" do
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
      it "タイトルが30文字以内でなければ保存できない" do
        @tweet.title = ("あ" * 51)
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("投稿タイトルは30文字以内で入力してください")
      end
      it "説明が140文字以内でなければ保存できない" do
        @tweet.description = ("あ" * 141)
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("説明は140文字以内で入力してください")
      end
      it "おすすめ度が1以上でなければ保存できない" do
        @tweet.recommended = 0
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("おすすめ度は1以上、5以下で入力して下さい")
      end
      it "おすすめ度が5以下でなければ保存できない" do
        @tweet.recommended = 6
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("おすすめ度は1以上、5以下で入力して下さい")
      end
    end
  end
end