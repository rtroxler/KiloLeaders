class LeaderboardsController < ApplicationController

  before_action :set_up_lift_and_leaderboard

  def index
  end

  def update
  end

  private
  def set_up_lift_and_leaderboard
    @lifts = Lift::LIFTS.map{ |l| l.to_s.humanize }
    @indexed_lifts = @lifts.each_with_index.map{ |l, idx| [l, idx] }
    @lift_name = @lifts[params[:lifts].to_i] || "snatch"
    @lift_name = @lift_name.parameterize.underscore
    Rails.logger.ap @lift_name
    @leaderboard = User.all.sort_by {|u| - u.pr_lifts.where(name: @lift_name, reps: 1).first.weight }
  end
end
