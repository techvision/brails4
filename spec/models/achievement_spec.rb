require 'spec_helper'

describe Achievement do
  let (:achievement) { FactoryGirl.build(:achievement)}

  describe "Fields" do

    it "has a field called 'user_id'" do
      expect(achievement).to have_field(:user_id).of_type(BSON::ObjectId)
    end

    it "has a field called 'topic_id'" do
      expect(achievement).to have_field(:topic_id).of_type(BSON::ObjectId)
    end

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
end
