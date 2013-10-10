require 'spec_helper'

describe TopicsController do
  describe "GET #show" do
    context "when user finished previous topics" do
      it "assigns the requested Topic to @topic"
      it "renders the :show template"
    end

    context "when user did not finished previous topics" do
      it "redirects to :index view"
    end
  end
end

