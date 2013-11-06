require 'spec_helper'

describe Level do
  let(:level) { FactoryGirl.create(:level)}
  let(:profile) { FactoryGirl.create(:profile)}
  let(:user) { profile.user}

  describe "Fields" do
    it "has field called 'name'" do
      expect(level).to have_field(:name).of_type(String)
    end
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(level).to be_valid
    end

    it 'is invalid without a name' do
      expect(level).to validate_presence_of(:name)
    end

    it 'is invalid without a topic' do
      expect(level).to validate_presence_of(:topics)
    end
  end

  describe "Associations" do
    it 'has many topics' do 
      expect(level).to have_many(:topics) 
    end

    it 'has many embbebed questions' do 
      expect(level).to have_many(:questions)
    end
  end

  describe "Behavior" do
    describe "#complete?(user.id)" do
      it "returns true if the user completed level" do
        question = level.topics.first.contents.first.questions.first

        attempt = build(:attempt, profile_id: profile.id, question_id: question.id, solved: true)
        profile.attempts << attempt
        
        expect(level.completed?(user.id)).to be_true 
      end

      it "returns false if the user did not completed the level" do
        question = level.topics.first.contents.first.questions.first

        unsolved_attempt = build(:attempt, profile_id: profile.id, question_id: question.id, solved: false)
        profile.attempts << unsolved_attempt
        
        expect(level.completed?(user.id)).to be_false
      end
    end
  end
end