require 'spec_helper'

describe AttemptAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user)  { build(:profile).user}
  let(:user2) { build(:profile).user}
  let(:attempt) { build(:attempt, profile_id: user.profile.id)}

   describe "class" do
    context "admin" do
      it "lets admins read attempts" do
        expect(Attempt.authorizer).to be_readable_by(admin)
      end
    end
  end

  describe "instance" do
    context "non-admin" do
      it "lets users read the attempts they own" do
        expect(attempt.authorizer).to be_readable_by(user)
      end

      it "does not let users read attempts they dont own" do
        expect(attempt.authorizer).not_to be_readable_by(user2)
      end
    end
  end
end