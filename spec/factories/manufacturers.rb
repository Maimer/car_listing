# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Manufacturer #{n}"}
    sequence(:country) { |n| "Country #{rand(5)+1}"}
  end
end
