require 'spec_helper'

shared_examples_for "Answerable" do |answerables|
  answerables.each do |elem|
    let(:answerable) { create(("full_" + elem.to_s.downcase.singularize).to_sym)}
    let(:question) { FactoryGirl.create(:full_question, questionable: answerable)}
    let(:hash_key) { (elem.to_s.downcase + "_id").to_sym }

    describe "GET #show" do
      context "when question is found" do
        it "assigns the requested Question to @question" do
          get :show, id: question.id, hash_key => answerable.id
          question1 = assigns[:question]

          expect(question).to eq question1
        end

        it "renders the :show template" do
          get :show, id: question.id, hash_key => answerable.id
          
          expect(response).to render_template :show
        end
      end

      context "when question is not found" do   
        it "redirects to index view" do 
          get :show, id: question.id, hash_key => answerable.id

          expect(response).to redirect_to answerable
        end
      end
    end
  end
end
