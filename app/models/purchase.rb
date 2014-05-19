class Purchase < ActiveRecord::Base
    belongs_to :subvice

    validates :quantity, presence: true
    validates :cost, presence: true
    validates :subvice_id, presence: true

    def group_by_criteria
        created_at.to_date.to_s(:db)
    end  

end