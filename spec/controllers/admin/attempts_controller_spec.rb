require 'spec_helper'

describe Admin::AttemptsController do
  let(:user) { FactoryGirl.create(:user)}
  let(:level) { FactoryGirl.create(:level)}
  let(:attempt) {FactoryGirl.create(:attempt, ) }

  describe "GET #index" do
    get :index, user_id: user.id
    page_attempts = assigns[:attempts]

    expect(attempt).to eql page_attempts
  end

  describe "GET #show" do
    get :show, user_id: user.id, attempt_id: attempt.id
    page_attempt = assigns[:attempt]

    expect(attempt).to eql page_attempt
  end
end