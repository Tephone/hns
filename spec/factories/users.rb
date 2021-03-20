FactoryBot.define do
  factory :user do
    name {'one'}
    email {'one@example.com'}
    password {'aaaaaa'}
  end
  factory :user2, class: User do
    name { 'two' }
    email { 'two@example.com' }
    password { "aaaaaa" }
  end
end