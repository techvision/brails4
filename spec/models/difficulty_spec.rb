require 'spec_helper'

describe Difficulty do
  before(:each) do
    @difficulty = build(:difficulty)
  end

  describe "Fields" do
    it "has a field called 'Name'" do
      expect(@difficulty).to have_field(:name).of_type(String)
    end

    it "has a field called 'Points'" do
      expect(@difficulty).to have_field(:points).of_type(Integer)
    end
  end

  describe "Validations" do

    it "has a valid factory" do
      expect(@difficulty).to be_valid
    end

    it 'is invalid without a name' do
      expect(build(:difficulty,name: nil)).not_to be_valid
    end

    it 'is invalid without points' do
      expect(build(:difficulty,points: nil)).not_to be_valid
    end
  end

  describe "Associations" do
    it "belongs to a question" do
      expect(@difficulty).to belong_to(:question)
    end
  end
end
