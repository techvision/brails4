require 'spec_helper'

describe Topic do
  let(:topic) { FactoryGirl.build(:topic)}

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
      expect(topic).to embed_many(:questions)
    end

    it 'has many contents' do
      expect(topic).to have_many(:contents)
    end
  end

  describe 'Behavior' do

    describe "#complete?(user_id)" do

      it "returns true if topic is complete" do
        user = build(:user)
        level = build(:level)
        level.topics << topic

        question = topic.questions.first
        correct_option = topic.questions.first.options.where(correct: true)

        question.answer(correct_option.id,user_id)

        expect(topic.complete?(user.id)).to be_true
      end

      it "returns false if topic is not complete" do
        user = build(:user)
        level = build(:level)
        level.topics << topic

        question = topic.questions.first
        incorrect_option = topic.questions.first.options.where(correct: false)

        question.answer(incorrect_option.id,user_id)

        expect(topic.complete?(user.id)).to be_false
      end
    end
  end
end