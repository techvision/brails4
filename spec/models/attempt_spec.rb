require 'spec_helper'

describe Attempt do
  before(:each) do
    @attempt = build(:attempt)
  end

  context "Fields" do
    it "has a field called 'Count'" do
      expect(@attempt).to have_field(:count).of_type(Integer)
    end
  end

  context "Validations" do
    it 'is invalid without a count value' do
      expect(build(:attempt, count: nil)).not_to be_valid
    end
  end

  context "Associations" do
    it 'belongs to an user' do
      expect(@attempt).to belong_to(:user)
    end

    it 'belongs to a question' do
      expect(@attempt).to belong_to(:user)
    end
  end
end
