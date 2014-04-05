require 'spec_helper'
require 'cancan/matchers'

describe "Student" do
  let!(:student) { create(:student) }
  let!(:ability) { Ability.new(student) }

  context "#level" do
    let!(:level) { create(:level) }

    it "can read level" do
      expect(ability).to be_able_to(:read, level)
    end

    it "cannot create level"
    it "cannot update level"
    it "cannot delete level"
  end

  context "#topic" do
    it "can read topic"
    it "cannot create topic"
    it "cannot update topic"
    it "cannot delete topic"
  end

  context "#content" do
    it "can read content"
    it "cannot create content"
    it "cannot update content"
    it "cannot delete content"
  end
end
