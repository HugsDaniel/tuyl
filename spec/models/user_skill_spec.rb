require 'rails_helper'

RSpec.describe UserSkill, type: 'model' do
  subject(:user_skill) { UserSkill.new(user: user, skill: skill) }

  let(:user) { build(:user) }
  let(:skill)     { build(:skill) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:skill) }
  end
end
