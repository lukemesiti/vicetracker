class Vice < ActiveRecord::Base
    belongs_to :user
    has_many :subvices

end