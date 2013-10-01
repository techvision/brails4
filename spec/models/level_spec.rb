require 'spec_helper'

describe Level do
  Context "Fields" do

    it "has a field 'title'" do
      it { should have_field(:name).of_type(String)}
    end

    it "has a field 'seq_number'" do
      it { should have_field(:seq_number).of_type(Integer)}
    end
  end

  Context "Validations" do
    it 'has a valid factory' do
      expect(build(:level)).to be_valid
    end

    it 'has a valid name' do
      it { should_not allow_value("123@").for(:name) }
    end

    it 'has a valid seq_number' do
      it { should validate_numericality_of(:seq_name) }
    end

    it 'is invalid without a name' do
     it {should validate_presence_of(:name)}
    end

    it 'is invalid without a seq_number' do
      it{should validate_presence_of(:seq_number)}
    end
  end

  Context "Associations" do
    it {should have_many(:topics)}
  end

end
