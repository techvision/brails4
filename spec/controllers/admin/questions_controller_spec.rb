require 'spec_helper'

describe Admin::QuestionsController do
  login(:admin)
  it_behaves_like "Questionable", [Level,Topic,Content]
end