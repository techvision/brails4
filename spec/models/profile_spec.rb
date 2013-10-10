require 'spec_helper'

describe Profile do
  let(:profile) { FactoryGirl.build(:profile)}

  describe "Fields" do
    it "has a field called 'name'" do
      expect(profile).to have_field(:name).of_type(String)
    end

    it "has a field called 'birthdate'" do
      expect(profile).to have_field(:birthdate).of_type(Date)
    end

    it "has a field called 'gender'" do
      expect(profile).to have_field(:gender).of_type(String)
    end

    it "has a field called 'address'" do
      expect(profile).to have_field(:address).of_type(String)
    end

    it "has a field called 'country'" do
      expect(profile).to have_field(:country).of_type(String)
    end

    it "has a field called 'total_points" do
      expect(profile).to have_field(:total_points).of_type(Integer)
    end

  end

  describe "Validations" do
    it "has a valid factory" do
      expect(profile).to be_valid
    end

    it 'is invalid without a name' do
      expect(profile).to validate_presence_of(:name)
    end

    it 'is invalid without a birthdate' do
      expect(profile).to validate_presence_of(:birthdate)
    end

    it 'is invalid without a gender' do
      expect(profile).to validate_presence_of(:gender)
    end

    it 'is invalid without an address' do
      expect(profile).to validate_presence_of(:address)
    end

    it 'is invalid without a country' do
      expect(profile).to validate_presence_of(:country)
    end
  end

  describe "Associations" do
    it "belongs to an 'User'" do
      expect(profile).to belong_to(:user)
    end

    it "has many Attempts" do
      expect(profile).to have_many(:attempts)
    end

    it "has many 'Comments'" do
      expect(profile).to have_many(:comments)
    end

    it "embeds many 'invitations'" do
      expect(profile).to embed_many(:invitations)
    end
  end
end