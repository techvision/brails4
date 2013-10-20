require 'spec_helper'

describe AttemptsController do
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}
  let(:achievement) { FactoryGirl.create(:achievement, user_id: user.id, topic_id: topic.id)}
  let(:question) { level.topics.last.contents.last.questions.last }
  let(:correct_option) { question.options.find_by(correct: true)}
  let(:incorrect_option){ question.options.find_by(correct: false)}

  describe "POST #create" do
    context "when correct option is selected" do
      it "creates a solved attempt in database" do
        expect{post :create, question_id: question.id, option_id: correct_option.id }.to change(user.profile.attempts.solved).by(1)
      end

      it "increments the user points" do
        expect{post :create, question_id: question.id, option_id: correct_option.id }.to change(user.profile.total_points).by(1)
      end

      context "when user finishes the level" do
        it "creates an achievement database record" do
          expect{post :create,question_id: question.id, option_id: correct_option.id }.to change(user.profile.achievements).by(1)
        end
      end
    end

    context "when incorrect option is selected" do
      it "creates an unsolved attempt in database" do
        expect{ post :create,question_id: question.id, option_id: incorrect_option.id }.to change(user.profile.attempts.solved).by(1)
      end

      it "does not increment the user points" do
        expect{ post :create, question_id: question.id, option_id: correct_option.id }.to_not change(user.profile.total_points)
      end

      it "does not create a achievement database record " do
        expect{ post :create,question_id: question.id, option_id: correct_option.id }.to_not change(user.profile.achievements)
      end
    end
  end
end