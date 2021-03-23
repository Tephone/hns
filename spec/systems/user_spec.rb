require 'rails_helper'
RSpec.describe 'user関連機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'devise関連機能' do
    it 'サインアップ機能' do
      visit new_user_registration_path
      fill_in 'Name', with: 'two'
      fill_in 'Eメール', with: 'two@example.com'
      fill_in 'パスワード', with: 'aaaaaa'
      fill_in 'パスワード（確認用）', with: 'aaaaaa'
      click_on 'Sign up'
      expect(page).to have_content '新しく投稿する'
    end
    it 'ログイン機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'one@example.com'
      fill_in 'パスワード', with: 'aaaaaa'
      click_on 'Log in'
      expect(page).to have_content '新しく投稿する'
    end
  end
  describe 'その他機能' do
    it 'ゲストログイン機能' do
      visit new_user_session_path
      click_on 'ゲストログイン（閲覧用）'
      expect(page).to have_content '新しく投稿する'
    end
  end
end