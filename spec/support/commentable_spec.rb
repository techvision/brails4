require 'spec_helper'

shared_examples_for "Commentable" do |commentables| 
  commentables.each do |elem|
    #login
    let(:profile) {FactoryGirl.create(:profile)}
    let(:commentable) { create(("full_" + elem.to_s.downcase.singularize).to_sym)}
    let(:comment) { FactoryGirl.create(:comment, profile: profile, commentable: commentable)}
    let(:invalid_attrs) { FactoryGirl.attributes_for(:comment, text: nil)}
    let(:attrs) { FactoryGirl.attributes_for(:comment)}
    let(:hash_key) { (elem.to_s.downcase + "_id").to_sym}

    before(:each) do
      #commentable.comments << comment
    end

    describe "GET #index" do
      it "populates an array of comments" do
        get :index, hash_key => commentable.id

        page_comments = assigns[:comments]

        expect(page_comments.sort).to eq commentable.comments.sort
      end

      it "renders the :index view" do
        get :index, hash_key => commentable.id

        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      context "when comment is found" do
        it "assigns the requested Comment to @comment" do
          get :show, id: comment.id, hash_key => commentable.id
          comment1 = assigns[:comment]

          expect(comment).to eq comment1
        end

        it "renders the :show template" do
          get :show, id: comment.id, hash_key => commentable.id
          
          expect(response).to render_template :show
        end
      end
    end

    describe "GET #new" do
      it "assigns a new Comment to @comment" do
        get :new, hash_key => commentable.id

        page_comment = assigns[:comment]
        expect(page_comment).to_not be_nil
      end

      it "renders the :new template" do
        get :new, hash_key => commentable.id

        expect(response).to render_template :new
      end
    end

    describe "GET #edit" do
      it "assigns the requested Comment to @comment" do
        get :edit, id: comment.id, hash_key => commentable.id
        page_comment = assigns[:comment]

        expect(comment).to eq page_comment
      end

      it "renders the :edit template" do
        get :edit, id: comment.id, hash_key => commentable.id

        expect(response).to render_template :edit
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new Comment in the database" do
          expect(commentable.comments.count).to eq 0
          #expect { post :create, hash_key => commentable.id, comment: attrs}.to change{commentable.comments.count}.by(1)
          post :create, hash_key => commentable.id, comment: attrs
          commentable = assigns :commentable
          comment = assigns :comment
          expect(commentable.comments.count).to eq 1
          expect(comment).to be_valid
        end

        it "redirects to the :index view" do
          post :create, hash_key => commentable.id, comment: attrs

          expect(response).to redirect_to commentable
        end
      end

      context "with invalid attributes" do
        it "doesn't save the new Comment in the database" do
          expect{post :create, comment: invalid_attrs, hash_key => commentable.id}.to_not change{commentable.comments.count}
        end

        it "redirects to the :new view" do
          post :create, comment: invalid_attrs, hash_key => commentable.id

          expect(response).to render_template :new
        end

        it "shows an error message" do
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

          expect(response).to redirect_to commentable
        end

        it "shows a success message" do
          attrs = attributes_for(:comment, text: "updated")

          put :update, id: comment.id, hash_key => commentable.id, comment: attrs

          expect(flash[:notice]).to eq "Comment successfully updated"
        end
      end

      context "with invalid attributes" do
        it "doesn't changes @comment attributes" do
          put :update, id: comment.id, hash_key => commentable.id, comment: invalid_attrs

          updated_comment = assigns[:comment]

          expect(comment).to eq updated_comment
        end

        it "redirects to the :index view" do
          put :update, id: comment.id, hash_key => commentable.id, comment: invalid_attrs

          expect(response).to redirect_to commentable
        end

        it "shows an error message" do
          put :update, id: comment.id, hash_key => commentable.id, comment: invalid_attrs

          expect(flash[:error]).to eq "Comment could not be updated"
        end
      end
    end

    describe "DELETE #destroy" do
      context "when find the comment" do
        it "deletes the comment" do
          comment
          expect{delete :destroy, id: comment.id, hash_key => commentable.id}.to change(Comment,:count).by(-1)	  
        end

        it "redirects to the :index view" do
          delete :destroy, id: comment.id, hash_key => commentable.id

          expect(response).to redirect_to commentable
        end
      end

      context "when can not find the comment" do
        it "redirects to index view" do
          delete :destroy, hash_key => commentable.id, id: comment.id

          expect(response).to redirect_to commentable
        end
      end
    end
  end
end
