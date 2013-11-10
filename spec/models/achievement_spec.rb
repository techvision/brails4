require 'spec_helper'

describe Achievement do
  let (:achievement) { build(:achievement)}

  describe "Fields" do
    it { should have_field(:score).of_type(Integer)}
    it { should have_field(:created_at).of_type(Time)}
  end

  describe "Validations" do
    it "has a valid factory" do
      expect(achievement).to be_valid
    end

    it "is invalid without a topic_id" do
      expect(achievement).to validate_presence_of(:topic_id)
    end

    it "is invalid without a score" do
      expect(achievement).to validate_presence_of(:score)
    end
  end

  describe "Associations" do
    it "is embedded in an user profile" do
      expect(achievement).to be_embedded_in :profile
    end

    it "belongs to a topic" do
      expect(achievement).to belong_to :topic
    end
  end
end