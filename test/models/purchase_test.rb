require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
    context "associations" do
        should belong_to :subvice
    end

    context "validations" do
        should validate_presence_of :quantity
        should validate_presence_of :cost
        should validate_presence_of :subvice_id
    end
end