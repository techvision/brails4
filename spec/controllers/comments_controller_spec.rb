require 'spec_helper'

describe CommentsController do

  describe "GET #new" do
    it "assigns a new Comment to @comment"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "can only edit comments of the current user"
    it "assigns the requested Comment to @comment"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Comment in the database"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "doesn't save the new Comment in the database"
      it "redirects to the :new view"
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "can only update comments of the current user"
      it "locates the requested @comment"
      it "changes @comment attributes"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "locates the requested @comment"
      it "doesn't changes @comment attributes"
      it "redirects to the :index view"
    end
  end

  describe "DELETE #destroy" do
    it "can only destroy comments of the current user"
    it "locates the requested @comment"
    it "deletes the comment"
    it "redirects to the :index view"
  end
end
