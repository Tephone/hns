require 'rails_helper'
RSpec.describe '乗馬日記関連機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @horse_diary = FactoryBot.create(:horse_diary, user_id: @user.id)
    visit new_user_session_path
    click_on 'ゲストログイン（閲覧用）'
  end
  it '日記投稿機能' do
  end
  it '日記編集機能' do
  end
  it '日記削除機能' do
  end
  it '日記検索機能' do
  end
end