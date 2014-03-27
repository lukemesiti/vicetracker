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

    context "consumed" do
        should "return the quantity consumed on a given day" do
            subvice = FactoryGirl.create(:subvice)
            had_today = subvice.purchases.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).sum('quantity')
            assert_equal had_today, subvice.user.consumed(subvice, Time.now)
        end
        should "not explode if there aren't any productions for the day" do
            subvice = FactoryGirl.create(:subvice)
            assert subvice.purchases.empty?
            assert_nothing_raised { subvice.user.consumed(subvice, Time.now) }
        end
    end

    context "goal achieved" do
        should "return true when the goal has been achieved" do
            subvice = FactoryGirl.create(:subvice)
            if (subvice.goal - subvice.user.consumed(subvice, Time.now)) >= 0
                goal_achieved = true
            else
                goal_achieved = false
            end
            assert_equal goal_achieved, subvice.user.goal_achieved(subvice, Time.now)
        end
    end

    context "total spent" do
        should "return the amount spent for a users subvice" do
            subvice = FactoryGirl.create(:subvice)
            # days since subvice was created
            days_since = ((Time.now - subvice.created_at)/86400).round(2) 
            assert_equal days_since, subvice.user.days_since_subvice_created(subvice)
        end
    end

    context "Would have spent - Actually spent" do
        should "return, in dollars amount average vs actually spent" do
            subvice = FactoryGirl.create(:subvice)
        end
    end
end
