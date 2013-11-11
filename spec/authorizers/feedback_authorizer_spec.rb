require 'spec_helper'

describe FeedbackAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:feedback) { build(:feedback)}

  describe "class" do
    it "allows admin to read feedbacks" do
      expect(Feedback.authorizer).to be_readable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to create feedbacks" do
      expect(feedback.authorizer).to be_creatable_by(user)
    end
  end
end