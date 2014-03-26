class Purchase < ActiveRecord::Base
    belongs_to :subvice

    validates :quantity, presence: true
    validates :cost, presence: true
    validates :subvice_id, presence: true

  

end