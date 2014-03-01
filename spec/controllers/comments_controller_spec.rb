require 'spec_helper'

describe CommentsController do
  it_behaves_like "Commentable", [Level]
  it_behaves_like "Commentable", [Topic]
  it_behaves_like "Commentable", [Content]
end
