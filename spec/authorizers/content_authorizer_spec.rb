require 'spec_helper'

describe ContentAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:content) { build(:content)}

  describe "class" do
    it "allows admin to manage contents" do
      expect(Content.authorizer).to be_manageable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to read contents" do
      expect(content.authorizer).to be_readable_by(user)
    end
  end
end