class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @lift = current_user.lifts.build if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @prboard = current_user.prboard
      #build leaderboard
      @leaderboard_hash = {}
      User.all.each {|u| @leaderboard_hash[u.id.to_s] = u.prboard }
      # will want a leaderboard helper, that takes the leaderboard hash and manipulates it based off what the user selects as the lift
    end
  end

  def help
  end
end
