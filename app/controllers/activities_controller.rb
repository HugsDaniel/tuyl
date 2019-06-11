class ActivitiesController < ApplicationController
  def index
    # => Toutes les activities
    @activities = Activity.all.includes(:skills)
  end
end
