require 'spec_helper'

describe Feedback do
  let(:feedback) { build(:feedback)}

  describe "Fields" do
    it { should have_field(:name).of_type(String)}
    it { should have_field(:email).of_type(String)}
    it { should have_field(:country).of_type(String)}
    it {should have_field(:text).of_type(String)}
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
      expect(build(:feedback, email: "abc")).to_not be_valid
    end
  end
end