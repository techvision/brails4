require 'spec_helper'

describe CommentsController do

  describe "GET #index" do
    it "populates an array of comments" do
      comments = 2.times.create(:comment)
      get :index
      page_comments = assigns(:comments)

      expect(comments).to eq(page_comments)
    end

    it "renders the :index view" do
      comment = create(:comment)
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do

    context "when comment is found" do
      it "assigns the requested Comment to @comment" do
        comment = create(:comment)

        get :show, id: comment.id
        comment1 = assigns[:comment]

        expect(comment).to eq comment1
      end

      it "renders the :show template" do
        comment = create(:comment)
        
        get :show, id: comment.id

        expect(response).to render_template :show
      end
    end

    context "when comment is not found" do
      it "shows an error message" do
        get :show, id: "test"

        expect(flash[:error]).to eq "Comment could not be found"
      end

      it "redirects to index view" do 
        get :show, id: "test"

        expect(reponse).to redirect_to :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Comment to @comment" do
      comment = build(:comment)

      get :new

      comment1 = assigns[:comment]
      expect(comment1).to eq comment
    end

    it "renders the :new template" do
      get :new

      expect(reponse).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested Comment to @comment" do
      comment = create(:comment)

      get :edit, id: comment.id
      comment1 = assigns[:comment]

      expect(comment).to eq comment1
    end

    it "renders the :edit template" do
      comment = create(:comment)

      get :edit, id: comment.id

      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Comment in the database" do
        attrs = attributes_for(:comment)

        expect { post :create, id: comment.id, comment: attrs}.to change(Comment,:count).by(1)
      end

      it "redirects to the :index view" do
        attrs = attributes_for(:comment)

        post :create, comment: attrs
        comment = assigns[:comment]

        expect(reponse).to redirect_to :index
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new Comment in the database" do
        invalid_comment = create(:comment, text: nil)
        post :create, invalid_comment

        expect(Comment.count).to_not change
      end

      it "redirects to the :new view" do
        invalid_comment = create(:comment, text: nil)
        post :create, invalid_comment

        expect(response).to redirect_to :new
      end

      it "shows an error message" do
        invalid_comment = create(:comment, text: nil)
        post :create, invalid_comment

        expect(flash[:error]).to eq "Comment could not be created"
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "changes @comment attributes" do
        comment = create(:comment)
        attrs = attributes_for(:comment, text: "updated")

        put :update, comment.id, comment: attrs

        updated_comment = assigns[:comment]

        expect(updated_comment.text).to eq attrs[:text]
      end

      it "redirects to the :index view" do
        comment = create(:comment)
        attrs = attributes_for(:comment, text: "updated")

        put :update, comment.id, comment: attrs

        updated_comment = assigns[:comment]

        expect(reponse).to redirect_to :index
      end

      it "shows a success message" do
        comment = create(:comment)
        attrs = attributes_for(:comment, text: "updated")

        put :update, comment.id, comment: attrs

        expect(flash[:notice]). to eq "Comment successfully updated"
      end
    end

    context "with invalid attributes" do
      it "doesn't changes @comment attributes" do
        comment = create(:comment)
        attrs = attributes_for(:comment, text: nil)

        put :update, comment.id, comment: attrs

        updated_comment = assigns[:comment]

        expect(comment).to eq updated_comment
      end

      it "redirects to the :index view" do
        comment = create(:comment)
        attrs = attributes_for(:comment, text: nil)

        put :update, comment.id, comment: attrs

        expect(reponse).to redirect_to :index
      end

      it "shows an error message" do
        comment = create(:comment)
        attrs = attributes_for(:comment, text: nil)

        put :update, comment.id, comment: attrs

        expect(flash[:error]). to eq "Comment could not be updated"
      end
    end
  end

  describe "DELETE #destroy" do
    context "when find the comment" do
      it "deletes the comment" do
        comment = create(:comment)

        delete :destroy, id: comment.id

        expect(Comment.count).to eq 0
      end

      it "redirects to the :index view" do
        comment = create(:comment)

        delete :destroy, id: comment.id

        expect(response).to redirect_to :index
      end
    end

    context "when can not find the comment" do
      it "shows an error message" do

      end

      it "redirects to index view" do

      end
    end
  end
end