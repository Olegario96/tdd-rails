FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order ##{n}" }
    customer # == association :customer, factory: :customer
  end
end
