require 'spec_helper'

describe QuestionsController do
  before(:each) do
    let(:question) {FactoryGirl.create(:question)}
    let(:user) {FactoryGirl.create(:user)}
  end

  describe "PUT #answer(user_id, option_id)" do
    context "when bonus question" do
      context "when user has not finished the level" do
        it "redirects to root page" do
          pending "implement logic to user finish level" #controller? model??
        end

        it "creates an unsolved attempt database record" 
        it "does not increment the user points" 
      end

      context "user has finished the level" do
        before(:each) do
          question.stub(answer: true)
          #pending "implement logic to user finish level"
        end

        context "when the answer is correct" do
          it "accepts the answer" do
            correct_option = question.options.find_by(correct: true)

            put :answer, correct_option.id, user.id

            expect(response).to be_success
          end

          it "increments the users points" do
            correct_option = question.options.find_by(correct: true)

            expect{put :answer, correct_option.id, user.id}.to change(user.profile.points).by(1)
          end

          it "creates an solved attempt database record" do
            expect{put :answer, question.options.first.id, user.id}.to change(user.profile.attempts.solved).by(1)
          end
        end

        context "when the answer is incorrect" do
          before do
            question.stub(answer: false)
          end

          it "does not increment the users points" do
            expect{put :answer, question.options.first.id, user.id}.to_not change(user.profile.points)
          end

          it "creates an unsolved attempt database record" do
            expect{put :answer, question.options.first.id, user.id}.to change(user.profile.attempts.unsolved).by(1)
          end
        end
      end
    end 

    context "when normal question" do
      before(:each) do
        let(:content) {FactoryGirl.create(:content)}
      end

      context "when the answer is correct" do
        it "accepts the answer"  do
          content.questions << question
          correct_option = question.options.find_by(correct: true)

          put :answer, correct_option.id, user.id

          expect(response).to be_success
        end

        it "increments the users points" do
          content.questions << question
          correct_option = question.options.find_by(correct: true)

          expect{put :answer, correct_option.id, user.id}.to change(user.profile.points).by(1)
        end

        it "creates an solved attempt database record" do
          content.questions << question
          correct_option = question.options.find_by(correct: true)

          expect{put :answer, correct_option.id, user.id}.to change(user.attempts.solved).by(1)
        end
      end

      context "when the answer is incorrect" do
        it "does not increment the users points" do
          content.questions << question
          incorrect_option = question.option.find_by(correct: false)

          expect{put :answer, incorrect_option.id, user.id}.to_not change(user.profile.points)
        end

        it "creates an unsolved attempt database record" do
          content.questions << question
          incorrect_option = question.option.find_by(correct: false)

          expect{ put :answer, incorrect_option.id, user.id}.to change(user.profile.attempts.unsolved).by(1)
        end
      end
    end
  end
end