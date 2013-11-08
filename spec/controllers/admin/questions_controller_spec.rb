require 'spec_helper'

describe Admin::QuestionsController do
  before(:each) do
    login(:admin)
  end
  
  it_behaves_like "Questionable", [Level,Topic,Content]
end