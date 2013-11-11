require 'spec_helper'

describe OptionAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:option) { build(:option)}

  describe "class" do
    it "allows admin to manage options" do
      expect(Option.authorizer).to be_manageable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to read options" do
      expect(option.authorizer).to be_readable_by(user)
    end
  end
end