require 'spec_helper'

describe TopicController do
  context 'non-admin user' do
    it 'completes the topic when the user pass all the questions'
    it 'manages how many questions the user has answered'
  end

  context 'admin user' do
    it 'can create a new topic'
    it 'can edit a topic'
    it 'can delete a topic'
    it 'can change the sequence order of a topic'
    it 'can upload an audio content'
  end
end
