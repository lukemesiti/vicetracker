require 'test_helper'

class ViceTest < ActiveSupport::TestCase
    context "associations" do
        should have_and_belong_to_many :users
        should have_many :subvices
    end

    context "validations" do
        should validate_presence_of :name
    end
end