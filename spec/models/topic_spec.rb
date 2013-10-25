require 'spec_helper'

describe Topic do
  let(:topic) { FactoryGirl.build(:topic) }
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}

  it_behaves_like "Commentable"

  describe 'Fields' do
    it "has a field called 'title'" do
      expect(topic).to have_field(:title).of_type(String)
    end

    it "has a field called 'seq_number'" do
      expect(topic).to have_field(:seq_number).of_type(Integer) 
    end
  end

  describe 'Validations' do
    it 'has a valid factory' do
      expect(topic).to be_valid
    end

    it 'has a valid seq_number' do
      expect(topic).to validate_numericality_of(:seq_number).to_allow(:only_integer => true, :greater_than => 0)
    end

    it 'is invalid without a title' do
      expect(topic).to validate_presence_of(:title)
    end

    it 'is invalid without a seq_number' do
      expect(topic).to validate_presence_of(:seq_number)
    end

    it 'is invalid without a content' do
      expect(topic).to validate_presence_of(:contents)
    end
  end

  describe 'Associations' do
    it 'has many embbebed questions' do
      expect(topic).to have_many(:questions)
    end

    it 'has many contents' do
      expect(topic).to have_many(:contents)
    end
  end

  describe 'Behavior' do
    #Return true if user has completed all contents and solved topic questions

    describe "#complete?(user_id)" do

      it "returns true if topic is complete" do
        question = level.topics.first.questions.first

        attempt = create(:attempt, question_id: question.id, profile_id: user.profile.id, solved: true)
        user.profile.attempts << attempt

        expect(topic.complete?(user.id)).to be_true
      end

      it "returns false if topic is not complete" do
        question = level.topics.first.questions.first

        unsolved_attempt = create(:attempt, question_id: question.id, profile_id: user.profile.id, solved: false)
        user.profile.attempts << unsolved_attempt
        
        expect(topic.complete?(user.id)).to be_false
      end
    end
  end
end