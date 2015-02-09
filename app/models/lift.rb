class Lift < ActiveRecord::Base
  belongs_to :user
  belongs_to :pr_board
  include Comparable

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates_numericality_of :weight, greater_than: 0

  before_save :check_if_pr

  LIFTS = [:snatch, :clean_and_jerk, :squat, :bench, :deadlift]

  private

  def check_if_pr
    existing_pr = self.user.pr_lifts.where(name: self.name, reps: self.reps).first
    if !existing_pr || self > existing_pr
      existing_pr.update! pr_board_id: nil if existing_pr
      self.pr_board = self.user.pr_board
    end
  end

  def <=> other_lift
    self.weight <=> other_lift.weight
  end
end
