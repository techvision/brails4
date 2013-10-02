require 'spec_helper'

describe Level do

  before(:each) do
    @level = build(:level)
  end

  describe "Fields" do
    it "has field called 'name'" do
      expect(@level).to have_field(:name).of_type(String)
    end
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(@level).to be_valid
    end

    it 'is invalid without a name' do
      expect(@level).to validate_presence_of(:name)
    end

    it 'is invalid without a topic' do
      expect(@level).to validate_presence_of(:topics)
    end
  end

  describe "Associations" do
    it 'has many topics' do 
      expect(@level).to have_many(:topics) 
    end

    it 'has many embbebed questions' do 
      expect(@level).to embed_many (:questions)
    end
  end
end
