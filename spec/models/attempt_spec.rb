require 'spec_helper'

describe Attempt do
  let(:attempt) { FactoryGirl.build(:attempt)}

  describe "Fields" do
    it "has a field called 'Count'" do
      expect(attempt).to have_field(:count).of_type(Integer)
    end

    it "has a field called 'Solved'" do
      expect(attempt).to have_field(:solved).of_type(Boolean)
    end 

    it "has a field called 'Points'" do
      expect(attempt).to have_field(:points).of_type(Integer)
    end
  end

  describe "Validations" do
    it 'is invalid without a count value' do
      expect(build(:attempt, count: nil)).not_to be_valid
    end
  end

  describe "Associations" do
    it 'belongs to an user' do
      expect(attempt).to belong_to(:user)
    end

    it 'belongs to a question' do
      expect(attempt).to belong_to(:user)
    end
  end
end