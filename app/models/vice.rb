class Vice < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_many :subvices

    validates :name, presence: true

end