require 'spec_helper'

describe Question do
  let(:level) { FactoryGirl.create(:level)}
  let(:question){ level.topics.first.contents.first.questions.first}
  let(:user) { FactoryGirl.create(:user)}

  it_behaves_like "Commentable"

  describe "Fields" do
    it "has a field called 'Title'" do
      expect(question).to have_field(:title).of_type(String)
    end

    it "has a field called 'Difficulty'" do
      expect(question).to have_field(:difficulty).of_type(Integer)
    end
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
        expect(build(:question, options: [build(:option), build(:incorrect_option), build(:incorrect_option)])).to be_valid
      end

      it "is invalid if more than one correct option is set" do
        expect(build(:question, options: [build(:option), build(:option), build(:option)])).not_to be_valid
      end

      it "is invalid if all options are incorrect" do
        expect(build(:question, options: [build(:incorrect_option), build(:incorrect_option), build(:incorrect_option)])).not_to be_valid
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
          solved_attempt = create(:attempt, profile_id: user.profile.id, question_id: question.id, solved: true)
          user.profile.attempts << solved_attempt

          expect(question.answered?(user.id)).to be_true
        end
      end

      context "when question is not answered yet" do
        it "returns false" do
          unsolved_attempt = create(:attempt, profile_id: user.profile.id, question_id: question.id, solved: false)
          user.profile.attempts << unsolved_attempt
          
          expect(question.answered?(user.id)).to be_false
        end
      end
    end
  end
end