require 'spec_helper'

describe Option do
  before(:each) do
    @option = build(:option)
  end

  context "Fields" do
    it "has a field called 'Text'" do
      expect(@option).to have_field(:text).of_type(String)
    end

    it "has a field called 'Correct'" do
      expect(@option).to have_field(:correct).of_type(Boolean)
    end
  end

  context "Validations" do
    it "has a valid factory" do
      expect(@option).to be_valid
    end

    it "has a valid 'correct' field value" do
      expect(build(:option, correct: "a")).not_to be_valid
    end

    it "is invalid without a text value" do
      expect(build(:option, text: nil)).not_to be_valid
    end

    it "is invalid without a correct field value" do
      expect(build(:option, correct: nil)).not_to be_valid
    end

    it "validates the length of the text field" do
      expect(@option).to validate_length_of(:text)
    end
  end
end
