require 'spec_helper'

describe QuestionAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:question) { build(:question)}

  describe "class" do
    it "allows admin to manage questions" do
      expect(Question.authorizer).to be_manageable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to read questions" do
      expect(question.authorizer).to be_readable_by(user)
    end

    it "allows users to answer questions" do
      expect(question.authorizer).to be_answerable_by(user)
    end
  end
end