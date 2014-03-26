FactoryGirl.define do
    # Define a basic subvice.
    factory :purchase do
        quantity 10
        cost 10
        subvice
    end
end
