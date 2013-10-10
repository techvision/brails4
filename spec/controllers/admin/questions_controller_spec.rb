require 'spec_helper'

describe QuestionsController do

  describe "GET #index" do
    it "populates an array of questions"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested Question to @question"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new question to @questions"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested Question to @question"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Question in the database"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "doesn't save the new Question in the database"
      it "redirects to the :new view"
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested @question"
      it "changes @question attributes"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "locates the requested @question"
      it "doesn't changes @question attributes"
      it "redirects to the :index view"
    end
  end

  describe "DELETE #destroy" do
    it "locates the requested @question"
    it "deletes the question"
    it "redirects to the :index view"
  end
end
