class LiftsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def create
    @lift = current_user.lifts.build(lift_params)
    if @lift.save
      flash[:success] = "Lift has been created."
      @lift_name = @lift.name.to_s.parameterize.underscore
      redirect_to :back
    else
      @feed_items = []
      #render 'users/show'
    end
  end

  def destroy
    @lift.destroy
    redirect_to root_url
  end

  private

  def lift_params
    p = params.require(:lift).permit(:name, :weight)
    p[:name] = p[:name].parameterize.underscore.to_sym
    p
  end

  def correct_user
    @lift = current_user.lifts.find_by(id: params[:id])
    redirect_to root_url if @lift.nil?
  end
end
