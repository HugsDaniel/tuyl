require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject(:skill) { build(:skill) }

  describe 'associations' do
    it { is_expected.to have_many(:activity_skills) }
    it { is_expected.to have_many(:activities) }
    it { is_expected.to have_many(:user_skills) }
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    # it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    # it { is_expected.to validate_uniqueness_of(:company_name).case_insensitive }
  end
end
