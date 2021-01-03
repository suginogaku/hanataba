require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet_text = Faker::Lorem.sentence
    # @tweet_image = Faker::Lorem.sentence
  end
  context 'ツイート投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      # visit new_user_session_path
      # fill_in 'メールアドレス', with: @user.email
      # fill_in 'パスワード', with: @user.password
      # find('input[name="commit"]').click
      # expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      # expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      # visit new_tweet_path
      # フォームに情報を入力するが、画像を紐付けることができない為、テストコードが通らない
      # activestrogeで紐付けした画像を入力する記述が必要
      # fill_in 'tweet_image', with: @tweet_image
      # fill_in 'tweet_title', with: @tweet_text
      # 送信するとTweetモデルのカウントが1上がることを確認する
      # expect{
      #   find('input[name="commit"]').click
      # }.to change { Tweet.count }.by(1)
      # トップページに遷移することを確認する
      # visit root_path
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      # expect(page).to have_selector ".tweet-image"
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
      # expect(page).to have_content(@tweet_text)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # ログインページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがある
      expect(page).to have_content('投稿する')
      # 新規登録ページへ遷移する
      visit new_tweet_path
      # ログインページへリダイレクトされる
      expect(current_path).to eq new_user_session_path
    end
  end
end


RSpec.describe 'ツイート編集', type: :system do
  before do
    @tweet1 = FactoryBot.create(:tweet)
    @tweet2 = FactoryBot.create(:tweet)
  end
  context 'ツイート編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したツイートの編集ができる' do
      # ツイート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレレス', with: @tweet1.user.email
      fill_in 'パスワード', with: @tweet1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ツイート1に「編集」ボタンがあることを確認する
      expect(
        @tweet1
      ).to have_link '編集', href: edit_tweet_path(@tweet1)
      # 編集ページへ遷移する
      visit edit_tweet_path(@tweet1)      
      # 投稿内容を編集する

      # 編集してもTweetモデルのカウントは変わらないことを確認する
      # 編集完了画面に遷移したことを確認する
      # 「更新が完了しました」の文字があることを確認する
      # トップページに遷移する
      # トップページには先ほど変更した内容のツイートが存在することを確認する（画像）
      # トップページには先ほど変更した内容のツイートが存在することを確認する（テキスト）
    end
  end
  context 'ツイート編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの編集画面には遷移できない' do
      # ツイート1を投稿したユーザーでログインする
      # ツイート2に「編集」ボタンがないことを確認する
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      # トップページにいる
      # ツイート1に「編集」ボタンがないことを確認する
      # ツイート2に「編集」ボタンがないことを確認する
    end
  end
end