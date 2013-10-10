require 'spec_helper'

describe Content do
  let(:content) { FactoryGirl.build(:content)}

  describe "Fields" do
    it "has a field called 'Title' " do
      expect(content).to have_field(:title).of_type(String)
    end

    it "has a field called 'Body' " do
      expect(content).to have_field(:body).of_type(String)
    end

    it "has a field called 'Summary' " do
      expect(content).to have_field(:summary).of_type(String)
    end

    it "has an embbebed mp3 audio file" do
      expect(content).to validate_attachment_presence(:audio_mp3)
    end

    it "has and embbebed ogg audio file" do
      expect(content).to validate_attachment_presence(:audio_ogg)
    end
  end

  describe "Validations" do
    it 'has a valid factory' do
      expect(content).to be_valid
    end

    it 'is invalid without a mp3 audio file' do
      expect(build(:content, audio_mp3: nil)).not_to be_valid
    end

    it 'is invalid without a valid ogg audio file' do
      expect(build(:content, audio_ogg: nil)).not_to be_valid
    end

    it 'validates the content type of mp3 audio file' do
      expect(content).to validate_attachment_content_type(:audio_mp3).allowing('audio/mp3')
    end

    it 'validates the content type of ogg audio file' do
      expect(content).to validate_attachment_content_type(:audio_ogg).allowing('audio/ogg')
    end

    it 'has a valid mp3 audio file' do
      expect(build(:content, audio_mp3: fixture_file_upload("#{Rails.root}/spec/factories/support/Lighthouse.jpg", "image/jpg"))).to_not be_valid
    end

    it 'has a valid ogg audio file' do
      expect(build(:content, audio_ogg: fixture_file_upload("#{Rails.root}/spec/factories/support/Lighthouse.jpg", "image/jpg"))).to_not be_valid
    end

    it 'validates the lenght of Title' do
      expect(content).to validate_length_of(:title)
    end

    it 'is invalid without a title' do
      expect(build(:content, title: nil)).not_to be_valid
    end

    it 'is invalid without a body' do
      expect(build(:content, body: nil)).to_not be_valid
    end

    it 'is invalid without a summary' do
      expect(build(:content, summary: nil)).to_not be_valid
    end

    it 'is invalid without a question' do
      expect(build(:content, questions: nil)).to_not be_valid
    end 
  end

  describe "Associations" do
    it 'has embedded questions' do
      expect(content).to embed_many(:questions)
    end
    
    it 'has embedded comments' do
      expect(content).to embed_many(:comments)
    end
  end
end