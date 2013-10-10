require 'spec_helper'

describe ContentsController do

  it "can upload a mp3 audio file"
  it "can upload a ogg audio file"

  describe "GET #index" do
    it "populates an array of contents"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested Content to @content"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Content to @content"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested Content to @content"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Content in the database"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "doesn't save the new Content in the database"
      it "redirects to the :new view"
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested @content"
      it "changes @content attributes"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "locates the requested @content"
      it "doesn't changes @content attributes"
      it "redirects to the :index view"
    end
  end

  describe "DELETE #destroy" do
    it "locates the requested @content"
    it "deletes the content"
    it "redirects to the :index view"
  end
end
