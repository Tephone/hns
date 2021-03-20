require 'rails_helper'
RSpec.describe 'whisper（SNS）関連機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: user.id)
    @comment = FactoryBot.create(:comment, user_id: user.id, post_id: @post.id)
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
    click_on 'test1'
    find('.first_delete').click
    accept_alert
    expect(page).to_not have_content('test1')

  end
  it 'コメント投稿機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    click_on 'test1'
    fill_in 'Content', with: 'comment2'
    click_on '登録する'
    expect(page).to have_content 'comment2'
  end
  it 'コメント編集機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    click_on 'test1'
    #binding.pry
    find('.second_edit').click
    fill_in 'Content', with: 'comment1_edited'
    click_on '登録する'
    expect(page).to have_content 'comment1_edited'
  end
  it 'コメント削除機能' do
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