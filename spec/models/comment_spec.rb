require 'rails_helper'
describe 'commentモデル機能', type: :model do
  context 'バリデーション' do
    it 'commentのcontentが空の場合' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user_id: user.id)
      comment = Comment.new(content: nil, user_id: user.id, post_id: post.id)
      expect(comment).not_to be_valid
    end
  end
end