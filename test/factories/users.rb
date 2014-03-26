FactoryGirl.define do
    # Define a basic devise user.
    factory :user do
        email "example@example.com"
        password "example123"
        password_confirmation "example123"
    end
end