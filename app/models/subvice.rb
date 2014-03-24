class Subvice < ActiveRecord::Base
    belongs_to :vice
    belongs_to :user
    has_many :purchases
    
end