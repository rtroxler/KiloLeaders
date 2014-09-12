class Lift < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates_numericality_of :weight, greater_than: 0
end
