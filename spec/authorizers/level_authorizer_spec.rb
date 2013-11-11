require 'spec_helper'

describe LevelAuthorizer do
  let(:user) { build(:user)}
  let(:admin) { build(:admin)}
  let(:admin_resource_instance) { build(:level)}
  let(:level) {build(:level)}

  describe "class" do
    context "admin user" do
      it "lets admins manage levels" do
        expect(LevelAuthorizer).to be_manageable_by(admin)
      end
    end

    context "non-admin user" do
      it "let students read the level" do
        expect(level.authorizer).to be_readable_by(user)
      end
    end
  end
end