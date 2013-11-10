require 'spec_helper'

describe Option do
  let(:option) { build(:option)}

  describe "Fields" do
    it { should have_field(:text).of_type(String)}
    it { should have_field(:correct).of_type(Mongoid::Boolean)}
  end

  describe "Validations" do
    it "has a valid factory" do
      expect(option).to be_valid
    end

    it "is invalid without a text value" do
      expect(build(:option, text: nil)).not_to be_valid
    end

    it "is invalid without a correct field value" do
      expect(build(:option, correct: nil)).not_to be_valid
    end

    it "validates the length of the text field" do
      expect(option).to validate_length_of(:text)
    end
  end

  describe "Associations" do
    it "is embedded in Question" do
      expect(option).to be_embedded_in(:question)
    end
  end
end
