FactoryBot.define do
    factory :account do
        # Use sequence to make sure that the value is unique
        sequence(:structure) { |n| "account-#{n}" }
        name { "test" }
    end

    factory :result_center do
        sequence(:name) { |n| "center #{n}" }
    end

    factory :entry do
        date { Time.new(2020, 9, 1) }
        value { 100.00 }
        memo { 'this is a memo' }
        account
        result_center
    end
end