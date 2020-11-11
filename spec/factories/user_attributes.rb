FactoryBot.define do
  factory :user_attribute do
    sequence(:name) {|n| "name#{n}"}
    profilerequired { false }
    signuprequired { false }
    
    trait :profilerequired do
      profilerequired { true }
    end
    trait :signuprequired do
      signuprequired { true }
    end
  end
end