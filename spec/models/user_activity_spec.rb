require 'rails_helper'

RSpec.describe UserActivity, type: 'model' do
  subject(:user_activity) { UserActivity.new(user: user, activity: activity) }

  let(:user) { build(:user) }
  let(:activity)     { build(:activity) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:activity) }
  end
end
