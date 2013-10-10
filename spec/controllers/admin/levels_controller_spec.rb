require 'spec_helper'

describe LevelsController do

  describe "GET #index" do
    it "populates an array of levels"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested Level to @level"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Level to @level"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested Level to @level"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Level in the database"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "doesn't save the new Level in the database"
      it "redirects to the :new view"
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested @level"
      it "changes @level attributes"
      it "redirects to the :index view"
    end

    context "with invalid attributes" do
      it "locates the requested @level"
      it "doesn't changes @level attributes"
      it "redirects to the :index view"
    end
  end

  describe "DELETE #destroy" do
    it "locates the requested @level"
    it "deletes the level"
    it "redirects to the :index view"
  end
end
