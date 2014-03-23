class Subvice < ActiveRecord::Base
    belongs_to :vice
    has_many :purchases
end