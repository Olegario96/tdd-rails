FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      upcased false
    end

    name { Faker::Name.name }
    sequence(:email, 33) { |n| "my_email_#{n}@email.com" }
    #email { Faker::Internet.email }

    trait :male do
      gender 'M'
    end

    trait :female do
      gender 'F'
    end

    trait :vip do
      vip true
      days_to_pay 30
    end

    trait :not_vip do
      vip false
      days_to_pay 10
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_not_vip, traits: [:not_vip]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_male_not_vip, traits: [:male, :not_vip]
    factory :customer_female_not_vip, traits: [:female, :not_vip]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
