class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :vices
  has_many :subvices
  has_many :purchases, through: :subvices

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def last_time_consumed(subvice_id)
    if Subvice.find(subvice_id).purchases.present?
        last_purchase(subvice_id).created_at
    else
        Subvice.find(subvice_id).created_at
    end
  end

  def last_purchase(subvice_id)
    self.purchases.where(subvice_id: subvice_id).order(:created_at).last
  end

  def time_since_last_consumed(subvice_id)
    Time.now - last_time_consumed(subvice_id)
  end
end
