class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :build_empty_lift

  private
  def build_empty_lift
    @lift = current_user.lifts.build if signed_in?
    @lifts = Lift::LIFTS.map{ |l| l.to_s.humanize }
    @indexed_lifts = @lifts.each_with_index.map{ |l, idx| [l, idx] }
  end
end
