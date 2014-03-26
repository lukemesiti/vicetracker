require 'test_helper'

class UserTest < ActiveSupport::TestCase
    context "associations" do
        should have_and_belong_to_many :vices
        should have_many :subvices
    end

    context "validations" do
        should validate_presence_of :email
        should validate_presence_of :password
    end

    context "last_purchase" do
        should "return the last purchase for this subvice" do
            subvice = FactoryGirl.create(:subvice)
            last_p = subvice.purchases.create(attributes_for(:purchase))
            assert_equal last_p, subvice.user.last_purchase(subvice.id)
        end
        should "no explode if there aren't any for this subvice" do
            subvice = FactoryGirl.create(:subvice)
            assert subvice.purchases.empty?
            assert_nothing_raised { subvice.user.last_purchase(subvice.id) }
        end

    end

    context "last_time_consumed" do
        should "return the time consumed" do
            subvice = FactoryGirl.create(:subvice)
            last_p = subvice.purchases.create(attributes_for(:purchase))
            last_c = last_p.created_at
            assert_equal last_c, subvice.user.last_time_consumed(subvice.id)
        end
    end

    context "seconds_since_last_consumed" do
        should "return the seconds since last consumed" do
            subvice = FactoryGirl.create(:subvice)
            last_p = subvice.purchases.create(attributes_for(:purchase))
            last_c = last_p.created_at
            sec_since_last_c = Time.now - last_c
            assert_equal sec_since_last_c, subvice.user.seconds_since_last_consumed(subvice.id)
        end
    end

    context "money_saved" do
        should "return the amount of money saved "
    end
end
