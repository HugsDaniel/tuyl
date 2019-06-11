class UserActivitiesController < ApplicationController
  def new
    @user_activity = UserActivity.new
  end

  def create
    @user_activity = current_user.user_activities.build(user_activity_params)

    if @user_activity.save
      redirect_to user_path(current_user)
      flash[:notice] = "Vous avez bien planifié une activité !"
    else
      render :new
      flash[:alert] = "Oula ça a merdé, recommence mon gars !"
    end
  end

  def accomplish
    @user_activity = UserActivity.find(params[:id])
    @user_activity.status = "accomplished"
    @user_activity.save

    @user_activity.calculate_points!

    redirect_to user_path(current_user)
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:activity_id, :begin_time, :end_time)
  end
end
