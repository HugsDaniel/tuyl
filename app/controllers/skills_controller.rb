class SkillsController < ApplicationController
  def index
    # => Toutes les skills
    @skills = Skill.all
  end
end
