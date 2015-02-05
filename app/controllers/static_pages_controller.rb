class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @lift = current_user.lifts.build if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @prboard = current_user.prboard
    end
  end

  def help
  end
end
