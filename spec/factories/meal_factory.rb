FactoryBot.define do
  factory :meal do
    title { "#{FFaker::Food.fruit}, #{FFaker::Food.herb_or_spice}, #{FFaker::Food.meat}" }
    eat_time { Time.now }
    user
  end
end
