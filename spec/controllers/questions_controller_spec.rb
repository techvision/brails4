require 'spec_helper'

describe QuestionsController do
  before(:each) do
    login
  end

  it_behaves_like "Answerable", [Level,Topic,Content]
end
