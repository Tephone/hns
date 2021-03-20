require 'rails_helper'
describe 'postモデル機能', type: :model do
  context 'バリデーション' do
    it 'postのcontentが空の場合' do
      user = FactoryBot.create(:user)
      post = Post.new(content: nil, user_id: user.id)
      expect(post).not_to be_valid
    end
  end
end