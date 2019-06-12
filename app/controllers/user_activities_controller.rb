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

    results = @user_activity.accomplish(user_activity_params)

    redirect_to user_path(current_user)
    flash[:notice] = display_results(results)
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:activity_id, :begin_time, :end_time, :satisfaction_level)
  end

  def display_results(results)
    string = "Vous avez gagné "
    results.each do |result|
      string += "#{result[:points]} points de #{result[:skill]} "
    end
    string
  end
end
