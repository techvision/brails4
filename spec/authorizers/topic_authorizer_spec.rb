require 'spec_helper'

describe TopicAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:topic) { create(:full_level).topics.first}

  describe "class" do
    it "allows admin to manage topics" do
      expect(Topic.authorizer).to be_manageable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to read topics" do
      expect(topic.authorizer).to be_readable_by(user)
    end
  end
end