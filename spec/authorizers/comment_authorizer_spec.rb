require 'spec_helper'

describe CommentAuthorizer do
  let(:admin) { build(:admin_profile).user}
  let(:user) { build(:profile).user}
  let(:user2) { build(:profile).user}
  let(:comment) { build(:comment, profile_id: user.profile.id)}
 
  describe "class" do
    it "allows admins to read the comments" do
      expect(Comment.authorizer).to be_readable_by(admin)
    end
  end

  describe "instance" do
    it "allows users to manage their comments" do
      expect(comment.authorizer).to be_manageable_by(user)
    end

    it "does not allow users to manage another user comments" do
      expect(comment.authorizer).not_to be_manageable_by(user2)
    end
  end
end