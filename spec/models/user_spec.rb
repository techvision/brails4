require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user)}

  describe "Validations" do
    it "has a valid factory" do
      expect(user).to be_valid
    end
  end

  describe "Associations" do

    it "has one profile" do
      expect(user).to have_one(:profile)
    end
  end
end
