require 'spec_helper'

describe Question do
  let(:level) { create(:full_level)}
  let(:topic) { level.topics.first}
  let(:content) { topic.contents.first}
  let(:question){ content.questions.first}
  let(:level_question) {level.questions.first }
  let(:topic_question) { topic.questions.first}
  let(:profile) { create(:profile)}
  let(:user) { profile.user}

  describe "Fields" do
    it { should have_field(:title).of_type(String)}
    it { should have_field(:difficulty).of_type(Integer)}
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(question).to be_valid
    end

    it 'is invalid without a title' do
      expect(build(:question, title: nil)).to_not be_valid
    end

    describe 'Options' do
      it 'is invalid without options' do
        expect(build(:question,options: nil)).not_to be_valid
      end

      it 'is valid if has only one correct answer' do
        expect(question).to be_valid
      end

      it "is invalid if more than one correct option is set" do
        expect(build(:question, options: [build(:option), build(:option), build(:option)], questionable_id: topic.id)).not_to be_valid
      end

      it "is invalid if all options are incorrect" do
        expect(build(:question, options: [build(:incorrect_option), build(:incorrect_option), build(:incorrect_option)],questionable_id: topic.id)).not_to be_valid
      end

      it 'has at least 3 options' do
        expect(question.options.length).to be >= 3
      end

      it 'has at most 5 options' do
        expect(question.options.length).to be < 5
      end
    end
  end

  describe "Associations" do
    it 'has many embedded options' do
      expect(question).to embed_many(:options)
    end

    it 'has many attempts' do
      expect(question).to have_many(:attempts)
    end
  end

  describe "Behavior" do
    describe "#answered?(user.id)" do
      context "when question is already answered" do
        it "returns true" do
          solved_attempt = build(:attempt, profile_id: profile.id, question_id: question.id, solved: true)
          user.profile.attempts << solved_attempt

          expect(question.answered?(user.id)).to be_true
        end
      end

      context "when question is not answered yet" do
        it "returns false" do
          unsolved_attempt = build(:attempt, profile_id: profile.id, question_id: question.id, solved: false)
          user.profile.attempts << unsolved_attempt
          
          expect(question.answered?(user.id)).to be_false
        end
      end
    end

    describe "#right_answer?(option_id)" do
      context "when correct option is given" do
        it "returns true" do
          correct_option = question.options.find_by(correct: true)

          expect(question.right_answer?(correct_option.id)).to eq true
        end
      end

      context "when incorrect option is given" do
        it "returns false" do
          incorrect_option = question.options.find_by(correct: false)

          expect(question.right_answer?(incorrect_option.id)).to eq false
        end
      end
    end

    describe "#find_topic" do
      context "when question belongs to a Level" do
        it "returns nil" do
          expect(level_question.find_topic).to eq nil
        end
      end

      context "when question belongs to a Topic" do
        it "returns the Topic" do
          expect(topic_question.find_topic).to eq topic
        end
      end

      context "when question belongs to a Content" do
        it "returns the contents topic" do
          expect(question.find_topic).to eq topic
        end
      end
    end
  end
end