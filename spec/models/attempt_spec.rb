require 'spec_helper'

describe Attempt do
  let(:profile) { create(:profile)}
  let(:level) { create(:full_level)}
  let(:question) { level.topics.first.contents.first.questions.first}
  let(:user) { profile.user }
  let(:correct_option) { question.options.find_by(correct: true)}
  let(:incorrect_option) { question.options.find_by(correct: false)}
  let(:attempt) { build(:attempt, question: question, profile: profile, solved: true)}
  let(:unsolved_attempt) { build(:attempt, question: question, profile: profile)}

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
    describe "::create_attempt(question_id,option_id, user_id)" do
      context "when correct option is selected", focus: true do
        it "creates a solved attempt database record" do
          expect{ Attempt.create_attempt(question.id,correct_option.id, user.id)}.to change {profile.attempts.solved}.by(1)
        end

        it "increments the user total points" do
          expect{ Attempt.create_attempt(question.id, correct_option.id, user.id)}.to change {profile.total_points}.by(1)
        end

        context "when user finishes the current topic" do
          it "creates an achievement database record" do
            expect{ Attempt.create_attempt( question.id, correct_option.id, user.id)}.to change{profile.achievements.count}.by(1)
          end
        end
      end

      context "when incorrect options is selected" do
        it "creates an unsolved attempt database record" do
          expect{ Attempt.create_attempt( question.id, incorrect_option.id, user.id)}.to change {user.profile.attempts.unsolved}.by(1)
        end

        it "do not increment the user total points" do
          expect{ Attempt.create_attempt( question.id, incorrect_option.id, user.id)}.to_not change {user.profile.total_points}
        end

        it "does not create a achievement database record" do
          expect{ Attempt.create_attempt( question.id, incorrect_option.id, user.id)}.to_not change{user.profile.achievements.count}
        end
      end
    end

    describe "::exists?(question,user)" do
      context "when attempt already exists" do
        it "returns true" do
          profile.attempts << attempt

          expect( Attempt.exists?(question,user)).to be true
        end
      end

      context "when attempt does not exist" do
        it "returns false" do
          expect(Attempt.exists?(question,user)).to be false
        end
      end
    end

    describe "::get_attempt(question,user)" do
      context "when attempt already exists" do
        it "returns the attempt" do
          profile.attempts << attempt

          expect(Attempt.get_attempt(question,user)).to eq attempt
        end

        it "increments the counter by 1" do
          profile.attempts << attempt

          expect(Attempt.get_attempt(question,user).count).to eq 2
        end
      end

      context "when attempt does not exist" do
        it "returns a new attempt" do
          expect(Attempt.get_attempt(question,user)).to_not be_nil
        end
      end
    end

    describe "#calculate_points" do
      it "sets the correct score in the attempt" do
        expect{attempt.send(:calculate_points)}.to change{attempt.points}.by 1
      end
    end
  end
end