require 'spec_helper'

describe Feedback do
  let(:feedback) { build(:feedback)}

  describe "Fields" do
    it "has a field called 'name'" do
      expect(feedback).to have_field(:name).of_type(String)
    end

    it "has a field called 'email'" do
      expect(feedback).to have_field(:email).of_type(String)
    end

    it "has a field called 'country'" do
      expect(feedback).to have_field(:country).of_type(String)
    end

    it "has a field called 'text'" do
      expect(feedback).to have_field(:text).of_type(String)
    end
  end

  describe "Validations" do
    it "has valid factory" do
      expect(feedback).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:feedback, name: nil)).to_not be_valid
    end

    it "is invalid without an email" do
      expect(build(:feedback, email: nil)).to_not be_valid
    end

    it "validates the format of the email" do
      expect(build(:feedback,email: "abc")).to_not be_valid
    end
  end
end