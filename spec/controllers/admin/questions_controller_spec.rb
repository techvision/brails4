require 'spec_helper'

describe Admin::QuestionsController do
  login(:admin)
  let(:content) { FactoryGirl.create(:content) }
  let(:question) { content.questions.first}
  let(:attrs) {FactoryGirl.attributes_for(:question)}
  let(:invalid_attrs) {FactoryGirl.attributes_for(:question, title: nil)}

  describe "GET #index" do
    it "populates an array of questions" do
      questions = content.questions

      get :index, content_id: content.id
      page_questions = assigns[:questions]

      expect(questions).to eq page_questions
    end

    it "renders the :index view" do
      get :index, content_id: content.id

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when find the question" do
      it "assigns the requested Question to @question" do
        get :show, id: question.id, content_id: content.id
        page_question = assigns[:question]

        expect(question).to eq page_question
      end

      it "renders the :show template" do
        get :show, id: question.id, content_id: content.id

        expect(response).to render_template :show
      end
    end

    context "when can not find the question" do
      it "shows an error message" do
        get :show, id: "test", content_id: content.id

        expect(flash[:error]).to eq "Could not find the specified Question"
      end

      it "redirects to index page" do
        get :show, id: "test", content_id: content.id

        expect(response).to redirect_to :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Question to @question" do
      get :new, content_id: content.id
      question = assigns[:question]

      expect(question).to_not be_nil
    end

    it "renders the :new template" do
      get :new, content_id: content.id

      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Question to @question" do
      get :edit, id: question.id, content_id: content.id
      page_question = assigns[:question]

      expect(question).to eq page_question
    end

    it "renders the :edit template" do
      get :edit, id: question.id, content_id: content.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Question in the database" do
       expect { post :create, content_id: content.id, question: attrs}.to change(Question,:count).by(1)
      end

      it "redirects to the :show view" do
        post :create, question: attrs, content_id: content.id

        expect(response).to redirect_to :show
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Question in the database" do
        post :create, question: invalid_attrs, content_id: content.id

        expect(Question,:count).to_not change
      end

      it "redirects to the :new view" do
        post :create, question: invalid_attrs, content_id: content.id

        expect(response).to redirect_to :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @question attributes" do
        attributes = attributes_for(:question, title: "New title")

        put :update, id: question.id, content_id: content.id, question: attributes
        question.reload

        expect(question.title).to eq "New title"
      end

      it "redirects to the :index view" do
        attributes = attributes_for(:question)

        put :update, id: question.id, content_id: content.id, question: attributes

        expect(response).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @question attributes" do
        put :update, id: question.id, content_id: content.id, question: invalid_attrs
        updated_question = assigns[:question]

        expect(question).to eq updated_question
      end

      it "redirects to the :edit view" do
        put :update, id: question.id, content_id: content.id, question: invalid_attrs

        expect(response).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the question" do
      delete :destroy, id: question.id, content_id: content.id

      expect(Question.count).to eq 0
    end

    it "redirects to the :index view" do
      delete :destroy, id: question.id, content_id: content.id

      expect(response).to redirect_to :index
    end
  end
end