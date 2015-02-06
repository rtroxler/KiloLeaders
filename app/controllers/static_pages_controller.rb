class StaticPagesController < ApplicationController

  def home
    if signed_in?
      #need to find a better home for this, App controller probably
      @lift = current_user.lifts.build if signed_in?


      # gotta - this so it sorts highest first ;)
      @leaderboard = User.all.sort_by {|u| - u.pr_lifts.where(name: "snatch", reps: 1).first.weight }
      # will want a leaderboard helper, that takes the leaderboard hash and manipulates it based off what the user selects as the lift
      # This will just be list of users sorted by default (snatch for now)
    end
  end

  def help
  end
end
