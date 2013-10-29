require 'spec_helper'

describe Profile do
  let(:level) { FactoryGirl.create(:level)}
  let(:topic1) { FactoryGirl.create(:topic, seq_number: 1)}
  let(:topic2) { FactoryGirl.create(:topic, seq_number: 2)}
  let(:profile) { FactoryGirl.create(:profile)}
  let(:user) { profile.user}

  describe "Fields" do
    it "has a field called 'name'" do
      expect(profile).to have_field(:name).of_type(String)
    end

    it "has a field called 'birthdate'" do
      expect(profile).to have_field(:birthdate).of_type(Date)
    end

    it "has a field called 'gender'" do
      expect(profile).to have_field(:gender).of_type(String)
    end

    it "has a field called 'address'" do
      expect(profile).to have_field(:address).of_type(String)
    end

    it "has a field called 'country'" do
      expect(profile).to have_field(:country).of_type(String)
    end

    it "has a field called 'total_points" do
      expect(profile).to have_field(:total_points).of_type(Integer)
    end
  end

  describe "Validations" do
    it "has a valid factory" do
      expect(profile).to be_valid
    end

    it 'is invalid without a name' do
      expect(profile).to validate_presence_of(:name)
    end

    it 'is invalid without a birthdate' do
      expect(profile).to validate_presence_of(:birthdate)
    end

    it 'is invalid without a gender' do
      expect(profile).to validate_presence_of(:gender)
    end

    it 'is invalid without an address' do
      expect(profile).to validate_presence_of(:address)
    end

    it 'is invalid without a country' do
      expect(profile).to validate_presence_of(:country)
    end
  end

  describe "Associations" do
    it "belongs to an 'User'" do
      expect(profile).to belong_to(:user)
    end

    it "has many Attempts" do
      expect(profile).to have_many(:attempts)
    end

    it "embeds many Achievements" do
      expect(profile).to embed_many(:achievements)
    end
  end

  describe "Behavior" do
    #Checks profile assignments and level topics to see if user finished the previous topics
    describe "#finished_previous_topics?(level_id, topic_id)" do
      it "returns true when the user finished all the level previous topics" do
        achievement = build(:achievement, topic_id: topic1.id)

        level.topics << topic1
        level.topics << topic2
        user.profile.achievements << achievement

        expect(user.profile.finished_previous_topics(topic2.id,level.id)).to be_true
      end

      it "returns false when the user has not finished all the level previous topics" do
        achievement = build(:achievement, topic_id: topic1.id)

        level.topics << topic1
        level.topics << topic2
        user.profile.achievements << achievement

        expect(user.profile.finished_previous_topics(topic2.id,level.id)).to be_false
      end
    end
  end
end