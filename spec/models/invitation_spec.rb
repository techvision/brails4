require 'spec_helper'

describe Invitation do
  let(:invitation) { FactoryGirl.build(:invitation)}

  describe "Fields" do
    it "has a field called 'name'" do
      expect(invitation).to have_field(:name).of_type(String)
    end

    it "has a field called 'phone_number'" do
      expect(invitation).to have_field(:phone_number).of_type(String)
    end

    it "has a field called 'address'" do
      expect(invitation).to have_field(:address).of_type(String)
    end

    it "has a field called 'email'" do
      expect(invitation).to have_field(:email).of_type(String)
    end

    it "has a field called 'text'" do
      expect(invitation).to have_field(:text).of_type(String)
    end
  end

  describe "Validations" do
    it "has a valid factory" do
      expect(invitation).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:invitation,name: nil)).not_to be_valid
    end

    it "is invalid withour a email" do
      expect(build(:invitation,name: nil)).not_to be_valid
    end
  end

  describe "Associations" do
    it "belongs to an User" do
      expect(invitation).to be_embedded_in(:user)
    end
  end
end
