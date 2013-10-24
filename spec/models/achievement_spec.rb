require 'spec_helper'

describe Achievement do
  let (:achievement) { FactoryGirl.build(:achievement)}

  describe "Fields" do
    it "has a field called 'score'" do
      expect(achievement).to have_field(:score).of_type(Integer)
    end
  end

  describe "Validations" do
    it "has a valid factory" do
      expect(achievement).to be_valid
    end

    it "is invalid without an user_id" do
      expect(achievement).to validate_presence_of(:user_id)
    end

    it "is invalid without a topic_id" do
      expect(achievement).to validate_presence_of(:topic_id)
    end

    it "is invalid without a score" do
      expect(achievement).to validate_presence_of(:score)
    end
  end

  describe "Associations" do
    it "belongs to an user" do
      expect(achievement).to belong_to :user
    end

    it "belongs to a topic" do
      expect(achievement).to belong_to :topic
    end
  end
end