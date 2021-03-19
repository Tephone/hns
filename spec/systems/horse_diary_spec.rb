require 'rails_helper'
RSpec.describe '乗馬日記関連機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    @horse_diary = FactoryBot.create(:horse_diary, user_id: user.id)
    @horse_diary = FactoryBot.create(:second_horse_diary, user_id: user.id)
    visit new_user_session_path
  end
  it '日記投稿機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    visit horse_diaries_path
    find('input#q_content_cont').set('third')
    click_on '日記を書く'
    find('textarea#horse_diary_content').set('third')
    click_on '登録する'
    expect(page).to have_content 'third'    
  end
  it '日記編集機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    visit horse_diaries_path
    click_on 'first'
    click_on '編集'
    find('textarea#horse_diary_content').set('forth')
    click_on '更新する'
    expect(page).to have_content 'forth' 
    expect(page).to_not have_content 'first'
  end
  it '日記削除機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    visit horse_diaries_path
    click_on 'first'
    click_on '削除'
    accept_alert
    expect(page).to_not have_content 'first'
  end
  it '日記検索機能' do
    visit new_user_session_path
    fill_in 'Eメール', with: 'one@example.com'
    fill_in 'パスワード', with: 'aaaaaa'
    click_on 'Log in'
    visit horse_diaries_path
    find('input#q_content_cont').set('first')
    click_on 'search'
    expect(page).to have_content 'first'
    expect(page).to_not have_content 'second'
  end
end