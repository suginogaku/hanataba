require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it 'commentカラムにコメントが保存できる' do
    expect(@comment).to be_valid
  end

  it 'commentカラムが空の場合コメントは保存できない' do
    @comment.comment = ""
    @comment.valid?
    expect(@comment.errors.full_messages).to include("コメントを入力してください")
  end
  
  it 'ユーザーが紐付いていないとコメントは保存できない' do
    @comment.user = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Userを入力してください")
  end
 
  it 'ツイートが紐付いていないとコメントは保存できない' do
    @comment.tweet = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Tweetを入力してください")
  end
  
end