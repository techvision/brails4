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
end