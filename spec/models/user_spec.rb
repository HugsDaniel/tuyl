require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:user_skills) }
    it { is_expected.to have_many(:skills) }
    it { is_expected.to have_many(:user_activities) }
    it { is_expected.to have_many(:activities) }
  end

  before do
    Skill.create!(name: "Force", description: "Force physique brute, pour taper fort", character: "Bucheron")
    Skill.create!(name: "Intelligence", description: "Mesure le raisonnement et la mémoire", character: "Mage")
    Skill.create!(name: "Sagesse", description: "Mesure la perception et l'intuition", character: "Druide")
    Skill.create!(name: "Dextérité", description: "Mesure l'agilité. Vous voyez les cartes ? Vous les voyez plus...", character: "Espion")
    Skill.create!(name: "Charisme", description: "Mesure la force de la personnalité", character: "Keutard")
    Skill.create!(name: "Constitution", description: "Mesure l'endurance", character: "Pyramide")
  end

  context "after user registration" do
    it "creates empty user skills" do
      user = create(:user)
      expect(user.user_skills).not_to be_empty
    end
  end
end
