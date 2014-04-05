require 'spec_helper'

describe Topic do
  let(:profile) { create(:profile)}
  let(:level) { create(:full_level)}
  let(:topic) { level.topics.first }
  let(:user)  { profile.user}
  let(:topic_question) { topic.questions.first}
  let(:content_question) { topic.contents.first.questions.first}
  let(:topic_question_attempt) { build(:attempt, question_id: topic_question.id, profile_id: profile.id, solved: true) }
  let(:content_question_attempt) { build(:attempt, question_id: content_question.id, profile_id: profile.id, solved: true)}

  it{ should accept_nested_attributes_for(:contents)}

  describe 'Fields' do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:seq_number).of_type(Integer)}
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
    describe "#complete?(user_id)" do
      it "returns true if topic is complete" do
        profile.attempts << topic_question_attempt
        profile.attempts << content_question_attempt

        expect(topic.complete?(user.id)).to be_true
      end

      it "returns false if topic is not complete" do
        unsolved_attempt = build(:attempt, question_id: topic_question.id, profile_id: profile.id, solved: false)

        profile.attempts << unsolved_attempt

        expect(topic.complete?(user.id)).to be_false
      end
    end
  end
end
