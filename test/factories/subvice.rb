FactoryGirl.define do
    # Define a basic subvice.
    factory :subvice do
        name "beer"
        consumed_per_day 10
        cost_per_day 50
        goal 2
        vice
        user
    end
end
