require 'rails_helper'
RSpec.describe 'whisper（SNS）関連機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: user.id)
  end
  it '文章及び画像投稿機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
  end
  it '投稿編集機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
  end
  it '投稿削除機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
  end
  it 'コメント機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
  end
  it '投稿お気に入り機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
  end
  it 'お気に入り一覧機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
  end
end