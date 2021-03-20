FactoryBot.define do
  factory :horse_diary do
    content {'first'}
  end
  factory :second_horse_diary, class: HorseDiary do
    content {'second'}
  end
end