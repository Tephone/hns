require 'rails_helper'
RSpec.describe 'whisper（SNS）関連機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user2)
    @post = FactoryBot.create(:post, user_id: user.id)
    @comment = FactoryBot.create(:comment, user_id: user.id, post_id: @post.id)
  end
  it '文章及び画像投稿機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    click_on '新しく投稿する'
    find('textarea#post_content').set('test2')
    attach_file 'post[image]', "#{Rails.root}/spec/factories/perry_s.jpg"
    click_on '登録する'
    expect(page).to have_content 'test2'
  end
  it '投稿編集機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    click_on 'test1'
    #binding.pry
    find('.first_edit').click
    find('textarea#post_content').set('test1_edited')
    click_on '更新する'
    expect(page).to have_content 'test1_edited'
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
    click_on 'test1'
    find('.second_delete').click
    accept_alert
    expect(page).to_not have_content 'comment1'
  end
  it '投稿お気に入り機能及びお気に入り一覧表示機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'two@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    click_on 'test1'
    click_on '♡'
    users_favorites_path
    expect(page).to have_content 'test1'
  end
end