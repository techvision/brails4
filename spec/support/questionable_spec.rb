require 'spec_helper'

shared_examples_for "Questionable" do |questionables|
  questionables.each do |elem|
    #login
    let(:question) { FactoryGirl.build(:question)}
    let(:invalid_attrs) { FactoryGirl.attributes_for(:question, title: nil)}
    let(:attrs) { FactoryGirl.attributes_for(:question)}
    let(:questionable) { FactoryGirl.create((elem.to_s.downcase.singularize).to_sym)}
    let(:hash_key) { (elem.to_s.downcase + "_id").to_sym }

    before(:each) do
      if questionable.class == Level
        questionable.bonus_questions << question
      else
        questionable.questions << question
      end
    end

    describe "GET #index" do
      it "populates an array of questions" do
        get :index, hash_key => questionable.id

        expect(questions).to eq(page_questions)
      end

      it "renders the :index view" do
        get :index, hash_key => questionable.id

        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      context "when question is found" do
        it "assigns the requested Question to @question" do
          get :show, id: question.id, hash_key => questionable.id
          question1 = assigns[:question]

          expect(question).to eq question1
        end

        it "renders the :show template" do
          get :show, id: question.id, hash_key => questionable.id
          
          expect(response).to render_template :show
        end
      end

      context "when question is not found" do
        it "shows an error message" do
          get :show, id: "test_id", hash_key => questionable.id

          expect(flash[:error]).to eq "Question could not be found"
        end

        it "redirects to index view" do 
          get :show, id: "test_id", hash_key => questionable.id

          expect(reponse).to redirect_to :index
        end
      end
    end

    describe "GET #new" do
      it "assigns a new Question to @question" do
        get :new, hash_key => questionable.id

        page_question = assigns[:question]
        expect(page_question).to_not be_nil
      end

      it "renders the :new template" do
        get :new, hash_key => questionable.id

        expect(reponse).to render_template :new
      end
    end

    describe "GET #edit" do
      it "assigns the requested Question to @question" do
        get :edit, id: question.id, hash_key => questionable.id
        page_question = assigns[:question]

        expect(question).to eq page_question
      end

      it "renders the :edit template" do
        get :edit, id: question.id, hash_key => questionable.id

        expect(response).to render_template :edit
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new Question in the database" do
          expect { post :create, hash_key => questionable.id, question: attrs}.to change{questionable.questions.count}.by(1)
        end

        it "redirects to the :index view" do
          post :create, hash_key => questionable.id, question: attrs

          expect(reponse).to redirect_to :show
        end
      end

      context "with invalid attributes" do
        it "doesn't save the new Question in the database" do
          expect{post :create, question: invalid_attrs, hash_key => questionable.id}.to_not change{questionable.questions.count}
        end

        it "redirects to the :new view" do
          post :create, question: invalid_attrs, hash_key => questionable.id

          expect(response).to redirect_to :new
        end

        it "shows an error message" do
          post :create, question: invalid_attrs, hash_key => questionable.id

          expect(flash[:error]).to eq "Question could not be created"
        end
      end
    end

    describe "PUT #update" do
      context "with valid attributes" do
        it "changes @question attributes" do
          attrs = attributes_for(:question, text: "updated")

          put :update, id: question.id, hash_key => questionable.id, question: attrs

          updated_question = assigns[:question]

          expect(updated_question.text).to eq attrs[:text]
        end

        it "redirects to the :index view" do
          attrs = attributes_for(:question, text: "updated")

          put :update, id: question.id, hash_key => questionable.id, question: attrs

          updated_question = assigns[:question]

          expect(reponse).to redirect_to :index
        end

        it "shows a success message" do
          attrs = attributes_for(:question, text: "updated")

          put :update, id: question.id, hash_key => questionable.id, question: attrs

          expect(flash[:notice]). to eq "Question successfully updated"
        end
      end

      context "with invalid attributes" do
        it "doesn't changes @question attributes" do
          put :update, id: question.id, hash_key => questionable.id, question: invalid_attrs

          updated_question = assigns[:question]

          expect(question).to eq updated_question
        end

        it "redirects to the :index view" do
          put :update, id: question.id, hash_key => questionable.id, question: invalid_attrs

          expect(reponse).to redirect_to :index
        end

        it "shows an error message" do
          put :update, id: question.id, hash_key => questionable.id, question: invalid_attrs

          expect(flash[:error]). to eq "Question could not be updated"
        end
      end
    end

    describe "DELETE #destroy" do
      context "when find the question" do
        it "deletes the question" do
          delete :destroy, id: question.id, hash_key => questionable.id

          expect(Question.count).to eq 0
        end

        it "redirects to the :index view" do
          delete :destroy, id: question.id, hash_key => questionable.id

          expect(response).to redirect_to :index
        end
      end

      context "when can not find the question" do
        it "shows an error message" do
          delete :destroy, hash_key => questionable.id, id: "test"

          expect(flash[:error]).to eql "Could not delete question. Question inexistent."
        end

        it "redirects to index view" do
          delete :destroy, hash_key => questionable.id, id: "test"

          expect(response).to redirect_to :index
        end
      end
    end
  end
end