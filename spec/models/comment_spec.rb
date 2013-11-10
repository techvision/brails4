require 'spec_helper'

describe Comment do
  let(:comment) { build(:comment)}

  describe "Fields" do
    it { should have_field(:text).of_type(String)}
  end

  describe "Validations" do
    #TODO 
    #Factory does not creates a valid object anymore because of the association validations.
    #it 'has a valid factory' do
    #  expect(comment).to be_valid
    #end

    it 'is invalid without a text' do
      expect(build(:comment, text: nil)).not_to be_valid
    end
  end

  describe "Associations" do
    it 'is a polymorphic association' do
      expect(comment).to belong_to(:commentable)
    end
  end
end
