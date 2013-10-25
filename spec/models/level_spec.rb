require 'spec_helper'

describe Level do
  let(:level) { FactoryGirl.create(:level)}
  let(:user) { FactoryGirl.create(:user)}

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

    it 'has many embbebed bonus questions' do 
      expect(level).to have_many(:bonus_questions)
    end
  end

  describe "Behavior" do
    # Returns true if user has achievements for all level topics
    describe "#complete?(user.id)" do
      it "returns true if the user completed level" do
        question = level.topics.first.contents.first.questions.first

        attempt = create(:attempt, profile_id: user.profile.id, question_id: question.id, solved: true)
        user.profile.attempts << attempt
        
        expect(level.complete?(user.id)).to be_true 
      end

      it "returns false if the user did not completed the level" do
        question = level.topics.first.contents.first.questions.first

        unsolved_attempt = create(:attempt, profile_id: user.profile.id, question_id: question.id, solved: false)
        user.profile.attemps << unsolved_attempt
        
        expect(level.complete?(user.id)).to be_false
      end
    end
  end
end
