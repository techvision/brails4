require 'spec_helper'

describe ProfileAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:profile) { user.profile}

  describe "class" do
    it "allows admin to read profiles" do
      expect(Profile.authorizer).to be_readable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to update their own profiles" do
      expect(profile.authorizer).to be_updatable_by(user)
    end

    it "allows users to read thei own profiles" do
      expect(profile.authorizer).to be_readable_by(user)
    end
  end
end