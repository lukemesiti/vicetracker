require 'test_helper'

class SubviceTest < ActiveSupport::TestCase
    context "associations" do 
        should belong_to :vice
        should belong_to :user
        should have_many :purchases
    end

    context "validations" do 
        should validate_presence_of :name
        should validate_presence_of :consumed_per_day
        should validate_presence_of :cost_per_day
        should validate_presence_of :goal
        should validate_presence_of :vice_id
        should validate_presence_of :user_id
    end
end