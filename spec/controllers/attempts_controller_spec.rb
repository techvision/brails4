require 'spec_helper'

describe AttemptsController do
  let(:profile){ create(:profile)}
  let(:level) { create(:full_level)}
  let(:achievement) { create(:achievement, profile_Id: profile.id, topic_id: topic.id)}
  let(:question) { level.topics.first.contents.first.questions.first }
  let(:correct_option)   { question.options.find_by(correct: true)}
  let(:incorrect_option) { question.options.find_by(correct: false)}
  let(:attempt) { build(:attempt, profile_id: profile.id, question_id: question.id )}
  let(:topic_points) {profile.attempts_by_topic(attempt.question.find_topic).inject(0) { |acc,elem| acc. + elem.points}}

  before(:each) do
    login
  end

  describe "POST #create" do
    context "when correct option is selected" do
      it "creates a solved attempt in database" do
        expect{post :create, question_id: question.id, option_id: correct_option.id }.to change{@user.profile.attempts.solved.count}.by(1)
      end

      it "increments the user points" do
#        attempt = @user.profile.attempts.detect {|attempt| attempt.question_id == question.id }
        expect{post :create, question_id: question.id, option_id: correct_option.id }.to change{@user.profile.total_points}.by(attempt.points)
      end

      context "when user finishes the topic" do
        it "creates an achievement database record" do
          expect{post :create,question_id: question.id, option_id: correct_option.id }.to change{@user.profile.achievements.count}.by(topic_points)
        end
      end
    end

    context "when incorrect option is selected" do
      it "creates an unsolved attempt in database" do
        expect{ post :create,question_id: question.id, option_id: incorrect_option.id }.to change{@user.profile.attempts.unsolved.count}.by(1)
      end

      it "does not increment the user points" do
        expect{ post :create, question_id: question.id, option_id: correct_option.id }.to_not change{@user.profile.total_points}
      end

      it "does not create a achievement database record " do
        expect{ post :create,question_id: question.id, option_id: correct_option.id }.to_not change{@user.profile.achievements.count}
      end
    end
  end
end
