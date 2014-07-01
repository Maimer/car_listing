# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Manufacturer #{n}" }
    sequence(:country) { "#{Country.all[rand(Country.all.size)][0]}" }
  end
end
