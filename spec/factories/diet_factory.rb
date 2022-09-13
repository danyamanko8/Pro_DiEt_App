FactoryBot.define do
  factory :diet do
    name {  FFaker::Lorem.word }
    description  { FFaker::Lorem.phrase }
    components { FFaker::Food.fruit }
    owner { assosiation(:user) }
  end
end
