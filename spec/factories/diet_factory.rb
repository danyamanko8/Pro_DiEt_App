FactoryBot.define do
  factory :diet do
    name {  FFaker::Lorem.word }
    description  { FFaker::Lorem.phrase }
    components { "#{FFaker::Food.fruit}, #{FFaker::Food.herb_or_spice}, #{FFaker::Food.meat}" }
    association :owner, factory: :user
  end
end
