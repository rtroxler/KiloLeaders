class Lift < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates_numericality_of :weight, greater_than: 0

  before_save :check_if_pr

  private

  # set up a before save to set PR if PR?
  def check_if_pr
    Rails.logger.ap self.user.prboard
    user_pr = self.user.public_send(self.name)
    if user_pr.nil? || self.weight > user_pr.to_i
      self.user.public_send(self.name + "=", self.weight)
      self.user.save!
    end
  end

end
