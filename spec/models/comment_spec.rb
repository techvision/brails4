require 'spec_helper'

describe Comment do
  let(:comment) {build(:comment)}

  describe "Fields" do
    it "has a field called 'text'" do
      expect(comment).to have_field(:text).of_type(String)
    end
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(comment).to be_valid
    end

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
