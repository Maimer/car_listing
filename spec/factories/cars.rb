# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    sequence(:color) { "#{Faker::Commerce.color}" }
    sequence(:year) { "#{rand(95) + 1920}" }
    sequence(:mileage) { "#{rand(100000)}" }
    sequence(:description) { "#{Faker::Lorem.paragraph(2)}" }

    manufacturer
  end
end
