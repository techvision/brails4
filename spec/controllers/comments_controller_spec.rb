require 'spec_helper'

describe CommentsController do  

  context 'admin user logged in' do

    describe 'GET index' do
      it 'should show all comments for a given request'
    end

    describe 'GET show' do
      it 'should show the info of the comment'
    end

    describe 'GET new' do
      it 'should return http success'
    end

    describe 'POST create' do
      it 'should create a new comment'
    end

    describe 'GET edit' do
      it 'should return http success'
    end

    describe 'PUT update' do
      it 'should update the comment'
    end

    describe 'DELETE destroy' do
      it 'should delete the comment'
    end
  end

  context 'non-admin user' do
    describe 'GET index' do
      it 'should show all comments for a given request'
    end

    describe 'GET show' do
      it 'should show the info of the comment'
    end

    describe 'GET new' do
      it 'should return http success'
    end

    describe 'POST create' do
      it 'should create a new comment'
    end

    describe 'GET edit' do
      it 'should return http success'
      it 'should edit only comments created by the user'
    end

    describe 'PUT update' do
      it 'should update the comment'
    end

    describe 'DELETE destroy' do
      it 'should delete the comment'
      it 'should destroy only comments created by the user'
    end
  end
end