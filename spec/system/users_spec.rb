require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @tweet = FactoryBot.build(:tweet)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '名前', with: @user.name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # トップページへ遷移するとレスポンスにサービス名が存在する
      expect(page).to have_content("Hanataba")
      # トップページへ遷移するとレスポンスに投稿ページに遷移するリンクが存在する
      expect(page).to have_link '投稿する', href: new_tweet_path
      # トップページへ遷移するとレスポンスにお店に行くリストに遷移するリンクが存在する" 
      # expect(page).to have_link 'お店に行くリスト', href: 
      # トップページへ遷移するとレスポンスにお気に入りリストに遷移するリンクが存在する" 
      # expect(page).to have_link 'お気に入りリスト', href: 
      # トップページへ遷移するとレスポンスに通知を受け取るアイコンが存在する" 
      expect(page).to have_selector(".fa-comment-alt")
      # トップページへ遷移するとレスポンスにユーザーアイコンが存在する
      expect(page).to have_selector(".fa-user")
      # 以下クリックからホバーに実装を変更した際に作成
      # カーソルを合わせるとプロフィールボタンが表示されることを確認する
      # カーソルを合わせるとユーザー一覧ボタンが表示されることを確認する
      # カーソルを合わせるとサービス紹介ボタンが表示されることを確認する
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      # expect(
      #   find("ブラウザ上の要素").find("ブラウザ上の要素").hover
      # ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # カーソルを合わせると新規登録ページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '名前', with: ""
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      fill_in 'パスワード（確認用）', with: ""
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end


RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      # カーソルを合わせるとログインページへ遷移するボタンがあることを確認する
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # トップページへ遷移するとレスポンスにサービス名が存在する
      expect(page).to have_content("Hanataba")
      # トップページへ遷移するとレスポンスに投稿ページに遷移するリンクが存在する
      expect(page).to have_link '投稿する', href: new_tweet_path
      # トップページへ遷移するとレスポンスにお店に行くリストに遷移するリンクが存在する" 
      # expect(page).to have_link 'お店に行くリスト', href: 
      # トップページへ遷移するとレスポンスにお気に入りリストに遷移するリンクが存在する" 
      # expect(page).to have_link 'お気に入りリスト', href: 
      # トップページへ遷移するとレスポンスに通知を受け取るアイコンが存在する" 
      expect(page).to have_selector(".fa-comment-alt")
      # トップページへ遷移するとレスポンスにユーザーアイコンが存在する
      expect(page).to have_selector(".fa-user")
      # 以下クリックからホバーに実装を変更した際に作成
      # カーソルを合わせるとプロフィールボタンが表示されることを確認する
      # カーソルを合わせるとユーザー一覧ボタンが表示されることを確認する
      # カーソルを合わせるとサービス紹介ボタンが表示されることを確認する
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      # expect(
      #   find(".user_nav").find("span").hover
      # ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      # カーソルを合わせるとログインページへ遷移するボタンがあることを確認する
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end