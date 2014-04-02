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

  def seconds_since_last_consumed(subvice_id)
    Time.now - last_time_consumed(subvice_id)
  end

  def consumed(subvice, date)
    # the total amount consumed on a given day
    subvice.purchases.where(created_at: date.beginning_of_day..date.end_of_day).sum('quantity')
  end

  def max_consumed_from_all_subvice(date)
    if purchases.where(created_at: date.beginning_of_day..date.end_of_day).present?
        list = purchases.where(created_at: date.beginning_of_day..date.end_of_day).select("subvices.name, (sum(purchases.quantity)) as q").group(:subvice_id, :name).order('q desc')
        new_list = []
        list.each do |x|
            if list[0].q == x.q
                new_list << x
            end
        end
        new_list
    else
        0
    end
  end

  def max_spent_from_all_subvice(date)
    if purchases.where(created_at: date.beginning_of_day..date.end_of_day).present?
        list = purchases.where(created_at: date.beginning_of_day..date.end_of_day).select("subvices.name, (sum(purchases.cost)) as q").group(:subvice_id, :name).order('q desc')
        new_list = []
        list.each do |x|
            if list[0].q == x.q
                new_list << x
            end
        end
        new_list
    else
        0
    end
  end

  def goal_achieved(subvice, date)
    if (subvice.goal - subvice.user.consumed(subvice, date)) >= 0
        return true
    else
        return false
    end
  end

  def days_since_subvice_created(subvice)
    (Time.now - subvice.created_at)/86400
  end

  def would_have_spent_minus_actually_spent(subvice)
  end

  def would_have_consumed_minus_actually_spent(subvice)
  end

end
