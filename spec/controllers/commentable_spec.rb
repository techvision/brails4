require 'spec_helper'

shared_examples_for "Commentable" do |commentables|

  commentables.each do |commentable|

    let(:comment) { FactoryGirl.build(:comment)}
    #let(:commentable) { FactoryGirl.create("#{described_class.to_s.partition("Controller")[0].downcase.singularize}".to_sym)}
    #let(:hash_key) { "#{described_class.to_s.partition('Controller')[0].downcase + '_id'}".to_sym }
    let(:hash_key) {(commentable.class.to_s.downcase + "_id").to_sym }

    describe "GET #index" do
      it "populates an array of comments" do
        commentable.comments << comment

        get :index, hash_key => commentable.id
        page_comments = assigns(:comments)

        expect(comments).to eq(page_comments)
      end

      it "renders the :index view" do
        commentable.comments << comment

        get :index, hash_key => commentable.id

        expect(response).to render_template :index
      end
    end

    describe "GET #show" do

      context "when comment is found" do
        it "assigns the requested Comment to @comment" do
          commentable.comments << comment

          get :show, id: comment.id, hash_key => commentable.id
          comment1 = assigns[:comment]

          expect(comment).to eq comment1
        end

        it "renders the :show template" do
          commentable.comments << comment

          get :show, id: comment.id, hash_key => commentable.id
          
          expect(response).to render_template :show
        end
      end

      context "when comment is not found" do
        it "shows an error message" do
         commentable.comments << comment

          get :show, id: "test_id", hash_key => commentable.id

          expect(flash[:error]).to eq "Comment could not be found"
        end

        it "redirects to index view" do 
          commentable.comments << comment

          get :show, id: "test_id", hash_key => commentable.id

          expect(reponse).to redirect_to :index
        end
      end
    end

    describe "GET #new" do
      it "assigns a new Comment to @comment" do
        get :new, hash_key => commentable.id

        comment1 = assigns[:comment]
        expect(comment1).to eq comment
      end

      it "renders the :new template" do
        get :new, hash_key => commentable.id

        expect(reponse).to render_template :new
      end
    end

    describe "GET #edit" do
      it "assigns the requested Comment to @comment" do
        get :edit, id: comment.id, hash_key => commentable.id
        comment1 = assigns[:comment]

        expect(comment).to eq comment1
      end

      it "renders the :edit template" do
        get :edit, id: comment.id, hash_key => commentable.id

        expect(response).to render_template :edit
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new Comment in the database" do
          attrs = attributes_for(:comment)

          expect { post :create, hash_key => commentable.id, comment: attrs}.to change(Comment,:count).by(1)
        end

        it "redirects to the :index view" do
          attrs = attributes_for(:comment)

          post :create, hash_key => commentable.id, comment: attrs

          expect(reponse).to redirect_to :show
        end
      end

      context "with invalid attributes" do
        it "doesn't save the new Comment in the database" do
          invalid_attrs = attributes_for(:comment, text: nil)
          post :create, comment: invalid_attrs, hash_key => commentable.id

          expect(Comment.count).to_not change
        end

        it "redirects to the :new view" do
          invalid_attrs = attributes_for(:comment, text: nil)
          post :create, comment: invalid_attrs, hash_key => commentable.id

          expect(response).to redirect_to :new
        end

        it "shows an error message" do
          invalid_attrs = attributes_for(:comment, text: nil)
          post :create, comment: invalid_attrs, hash_key => commentable.id

          expect(flash[:error]).to eq "Comment could not be created"
        end
      end
    end

    describe "PUT #update" do
      context "with valid attributes" do
        it "changes @comment attributes" do
          attrs = attributes_for(:comment, text: "updated")

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          updated_comment = assigns[:comment]

          expect(updated_comment.text).to eq attrs[:text]
        end

        it "redirects to the :index view" do
          attrs = attributes_for(:comment, text: "updated")

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          updated_comment = assigns[:comment]

          expect(reponse).to redirect_to :index
        end

        it "shows a success message" do
          attrs = attributes_for(:comment, text: "updated")

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          expect(flash[:notice]). to eq "Comment successfully updated"
        end
      end

      context "with invalid attributes" do
        it "doesn't changes @comment attributes" do
          attrs = attributes_for(:comment, text: nil)

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          updated_comment = assigns[:comment]

          expect(comment).to eq updated_comment
        end

        it "redirects to the :index view" do
          attrs = attributes_for(:comment, text: nil)

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          expect(reponse).to redirect_to :index
        end

        it "shows an error message" do
          attrs = attributes_for(:comment, text: nil)

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          expect(flash[:error]). to eq "Comment could not be updated"
        end
      end
    end

    describe "DELETE #destroy" do
      context "when find the comment" do
        it "deletes the comment" do
          commentable.comments << comment

          delete :destroy, id: comment.id, hash_key => commentable.id

          expect(Comment.count).to eq 0
        end

        it "redirects to the :index view" do
          delete :destroy, id: comment.id, hash_key => commentable.id

          expect(response).to redirect_to :index
        end
      end

      context "when can not find the comment" do
        it "shows an error message" do
          delete :destroy, hash_key => commentable.id, id: "test"

          expect(flash[:error]).to eql "Could not delete comment. Comment inexistent."
        end

        it "redirects to index view" do
          delete :destroy, hash_key => commentable.id, id: "test"

          expect(response).to redirect_to :index
        end
      end
    end
  end
end

describe CommentsController do 
  level =  FactoryGirl.create(:level)
  topic = level.topics.last
  content = topic.contents.last
  question = content.questions.last

  it_behaves_like "Commentable", [level,topic,content,question]
end