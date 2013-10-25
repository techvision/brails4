require 'spec_helper'

describe Attempt do
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}
  let(:attempt) { FactoryGirl.build(:attempt)}
  let(:question) { level.topics.first.contents.first.questions.first}

  describe "Fields" do
    it "has a field called 'Count'" do
      expect(attempt).to have_field(:count).of_type(Integer)
    end

    it "has a field called 'Solved'" do
      expect(attempt).to have_field(:solved).of_type(Boolean)
    end 

    it "has a field called 'Points'" do
      expect(attempt).to have_field(:points).of_type(Integer)
    end
  end

  describe "Validations" do
    it 'is invalid without a count value' do
      expect(build(:attempt, count: nil)).not_to be_valid
    end
  end

  describe "Associations" do
    it 'belongs to an user' do
      expect(attempt).to belong_to(:profile)
    end

    it 'belongs to a question' do
      expect(attempt).to belong_to(:question)
    end
  end

  describe "Behavior" do
    describe "#create_attempt(option_id, question_id, user_id)" do
      context "when correct option is selected" do
        it "creates a solved attempt database record" do
          expect{ create(:attempt, user_id: user.id, question_id: question.id, solved: true)}.to change {user.profile.attempts.solved}.by(1)
        end

        it "increments the user total points" do
          expect{ create(:attempt, user_id: user.id, question_id: question.id, solved: true)}.to change {user.profile.total_points}.by(1)
        end

        context "when user finishes the current level" do
          it "creates an achievement database record" do
            expect{create(:attempt, user_id: user.id, question_id: question.id, solved: true)}.to change{user.profile.achievements.count}.by(1)
          end
        end
      end

      context "when incorrect options is selected" do
        it "creates an unsolved attempt database record" do
          expect{ create(:attempt, user_id: user.id, question_id: question.id, solved: false)}.to change {user.profile.attempts.unsolved}.by(1)
        end

        it "do not increment the user total points" do
          expect{ create(:attempt, user_id: user.id, question_id: question.id, solved: true)}.to_not change {user.profile.total_points}
        end

        it "does not create a achievement database record" do
          expect{ create(:attempt, question_id: question.id, option_id: correct_option.id)}.to_not change{user.profile.achievements.count}
        end
      end
    end
  end
end