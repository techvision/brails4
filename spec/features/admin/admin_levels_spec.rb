require 'spec_helper'

describe "Admin::Levels" do
  before do
    login_with :admin
  end

  describe "GET /levels" do
    it "displays levels" do
      level = create(:full_level, name: "test_level")
      visit admin_levels_path
      expect(page).to have_content("test_level")
    end
  end

  describe "GET /level/new" do
    it "displays the new level form"
  end

  describe "POST /level/new" do
    context "when correct input data" do
      it "creates a new level"
      it "redirects to index page"
    end

    context "when incorrect input data" do
      it "redirects to the :new page"
    end
  end
end