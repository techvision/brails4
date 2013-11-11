require 'spec_helper'

describe AchievementAuthorizer do
  let(:user) { build(:profile).user}
  let(:user2) { build(:profile).user}
  let(:admin) { build(:admin)}
  let(:achievement) { build(:achievement, profile: user.profile)}

  describe "class" do
    context "admin" do
      it "lets admins read achievements" do
        expect(Achievement.authorizer).to be_readable_by(admin)
      end
    end
  end

  describe "instance" do
    context "non-admin" do
      it "lets users read the achievements they own" do
        expect(achievement.authorizer).to be_readable_by(user)
      end

      it "does not let users read achievements that they dont own" do
        expect(achievement.authorizer).not_to be_readable_by(user2)
      end
    end
  end
end