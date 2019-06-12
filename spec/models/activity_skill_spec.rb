require 'rails_helper'

RSpec.describe ExpCalculatorService do
  let(:user)      { create(:user) }
  let(:activity)  { create(:activity) }

  before do
    Skill.create!(name: "Force", description: "Force physique brute, pour taper fort", character: "Bucheron")
    Skill.create!(name: "Intelligence", description: "Mesure le raisonnement et la mémoire", character: "Mage")
    Skill.create!(name: "Sagesse", description: "Mesure la perception et l'intuition", character: "Druide")
    Skill.create!(name: "Dextérité", description: "Mesure l'agilité. Vous voyez les cartes ? Vous les voyez plus...", character: "Espion")
    Skill.create!(name: "Charisme", description: "Mesure la force de la personnalité", character: "Keutard")
    Skill.create!(name: "Constitution", description: "Mesure l'endurance", character: "Pyramide")
  end

  context "when a user completes an activity" do
    before do
      ActivitySkill.create(activity: activity, skill: Skill.first)
      UserActivity.create(user: user, activity: activity, satisfaction_level: 2)
    end

    it "calculates the exp gain" do
      current_user_skill_points = user.user_skills.find_by(skill: activity.skills.first).amount

      results = ExpCalculatorService.new(UserActivity.last).call

      expected_points_after_calculation = current_user_skill_points + results.first[:points]

      expect(user.user_skills.find_by(skill: activity.skills.first).amount).to eq(expected_points_after_calculation)
    end
  end
end
