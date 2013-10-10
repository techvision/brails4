require 'spec_helper'

describe TopicsController do

  describe "GET #index" do
    it "populates an array of levels"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested Topic to @topic"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Topic to @topics"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested Topic to @topic"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Topic in the database"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "doesn't save the new Topic in the database"
      it "redirects to the :new view"
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested @topic"
      it "changes @topic attributes"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "locates the requested @topic"
      it "doesn't changes @topic attributes"
      it "redirects to the :index view"
    end
  end

  describe "DELETE #destroy" do
    it "locates the requested @topic"
    it "deletes the topic"
    it "redirects to the :index view"
  end
end

