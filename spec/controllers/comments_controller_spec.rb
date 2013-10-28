require 'spec_helper'

describe CommentsController do
  it_behaves_like "Commentable", [Level,Topic,Content,Question]
end
