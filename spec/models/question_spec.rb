require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.build(:question)}

  describe "Fields" do
    it "has a field called 'Title'" do
      expect(question).to have_field(:title).of_type(String)
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

    it 'has one difficulty' do
      expect(question).to have_one(:difficulty)
    end
  end

  describe "Behavior" do
    
    describe "#answer(option_id, user_id)" do
      context "when correct option selected" do
        it "creates a new solved attempt database record" do
          user = build(:user)
          expect(user.profile.attempts.count).to eq(0)
          option = question.options.find_by(correct: true)
          question.answer(option.id, user.id)

          expect(user.profile.attempts.first.solved).to be_true
        end

        it "increases the ammount of solved questions of the user" do
          user = build(:user)
          user_attempts = user.profile.attempts.count
          expect(user_attempts).to eq(0)
          option = question.options.find_by(correct: true)

          expect(question.answer(option.id, user.id)).to change{user.profile.attempts.find_by(solved: true).count}.by(1)
        end

        it "increases the ammount of points of the user by the question value" do
          user = build(:user)
          user_attempts = user.profile.attempts.count
          option = question.options.find_by(correct: true)
          total_points = user.profile.total_points

          expect(question.answer(option.id, user.id)).to change{user.profile.total_points}.by(question.difficulty.points)
        end
      end

      context "when incorrect option selected" do
        it "creates a new unsolved attempt database record" do
          user = build(:user)
          expect(user.profile.attempts.count).to eq(0)
          option = question.options.find_by(correct: false)
          question.answer(option.id, user.id)

          expect(user.profile.attempts.first.solved).to be_false
        end

        it "does not change the ammount of solved questions of the user" do
          user = build(:user)
          user_attempts = user.profile.attempts.count
          expect(user_attempts).to eq(0)
          option = question.options.find_by(correct: false)

          expect(question.answer(option.id, user.id)).not_to change{user.profile.attempts.find_by(solved: true).count}
        end

        it "does not change the ammount of points of the user" do
          user = build(:user)
          user_attempts = user.profile.attempts.count
          option = question.options.find_by(correct: false)
          total_points = user.profile.total_points

          expect(question.answer(option.id, user.id)).not_to change{user.profile.total_points}
        end
      end
    end

    describe "#answered?(user.id)" do
      context "when question is already answered" do
        it "returns true" do
          user = build(:user)
          option = question.options.find_by(correct: true)
          question.answer(option.id, user.id)

          expect(question.answered?(user.id)).to be_true
        end
      end

      context "when question is not answered yet" do
        it "returns false" do
          user = build(:user)
          option = question.options.find_by(correct: false)
          question.answer(option.id, user.id)

          expect(question.answered?(user.id)).to be_false
        end
      end
    end
  end
end