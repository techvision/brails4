require 'spec_helper'

describe Level do

  before(:all) do
    @level = build(:level)
  end

  context "Fields" do
    it "has field called 'name'" do
      expect(@level).to have_field(:name).of_type(String)
    end
  end

  context "Validations" do
    it 'has a valid factory' do
      expect(@level).to be_valid
    end

    it 'has a valid name' do
      expect(build(:level, name: "123@")).to_not be_valid
    end

    it 'is invalid without a name' do
      expect(@level).to validate_presence_of(:name)
    end

    it 'is invalid without a topic' do
      expect(@level).to validate_presence_of(:topics)
    end
  end

  context "Associations" do
    it 'it has many topics' do 
      expect(@level).to have_many(:topics) 
    end

    it 'it has many embbebed questions' do 
      expect(@level).to embed_many (:questions)
    end
  end
end
