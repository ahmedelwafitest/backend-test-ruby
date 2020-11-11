FactoryBot.define do
  factory :event_attribute do
    sequence(:name) {|n| "name#{n}"}
    required { false }
    
    trait :required do
      required { true }
    end
  end
end