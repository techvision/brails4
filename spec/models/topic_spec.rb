require 'spec_helper'

describe Topic do
  before(:each) do
    @topic = build(:topic)
  end

  describe 'Fields' do
    it "has a field called 'title'" do
      expect(@topic).to have_field(:title).of_type(String)
    end

    it "has a field called 'seq_number'" do
      expect(@topic).to have_field(:seq_number).of_type(Integer) 
    end
  end

  describe 'Validations' do
    it 'has a valid factory' do
      expect(@topic).to be_valid
    end

    it 'has a valid seq_number' do
      expect(@topic).to validate_numericality_of(:seq_number).to_allow(:only_integer => true, :greater_than => 0)
    end

    it 'its invalid without a title' do
      expect(@topic).to validate_presence_of(:title)
    end

    it 'its invalid without a seq_number' do
      expect(@topic).to validate_presence_of(:seq_number)
    end

    it 'its invalid without a content' do
      expect(@topic).to validate_presence_of(:contents)
    end
  end

  describe 'Associations' do
    it 'has many embbebed questions' do
      expect(@topic).to embed_many(:questions)
    end

    it 'has many contents' do
      expect(@topic).to have_many(:contents)
    end
  end
end
