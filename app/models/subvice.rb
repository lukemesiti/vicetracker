class Subvice < ActiveRecord::Base
    belongs_to :vice
    belongs_to :user
    has_many :purchases, dependent: :destroy

    validates :name, presence: true
    validates :consumed_per_day, presence: true
    validates :cost_per_day, presence: true
    validates :goal, presence: true
    validates :vice_id, presence: true
    validates :user_id, presence: true
    
end