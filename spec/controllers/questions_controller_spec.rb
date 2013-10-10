require 'spec_helper'

describe QuestionsController do
  describe "PUT #answer(user_id, option_id)" do
    context "when bonus question" do
      context "when user has not finished the level" do
        it "redirects to root page"
        it "creates an unsolved attempt database record" 
        it "does not increment the user points" 
      end

      context "user has finished the level" do
        context "when the answer is correct" do
          it "accepts the answer" 
          it "increments the users points"
          it "creates an solved attempt database record"
        end

        context "when the answer is incorrect" do
          it "does not increment the users points"
          it "creates an unsolved attempt database record"
        end
      end
    end 

    context "when normal question" do
      context "when the answer is correct" do
        it "accepts the answer" 
        it "increments the users points"
        it "creates an solved attempt database record"
      end

      context "when the answer is incorrect" do
        it "does not increment the users points"
        it "creates an unsolved attempt database record"
      end
    end
  end
end
