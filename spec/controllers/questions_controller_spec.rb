require 'spec_helper'

describe QuestionsController do
  it_behaves_like "Answerable", [Level,Topic,Content]
end