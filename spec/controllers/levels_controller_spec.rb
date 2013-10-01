require 'spec_helper'

describe LevelsController do

  context 'admin user logged in' do

    describe 'GET index ' do
      it 'should show all the levels'
    end

    describe 'GET show' do
      it 'should show the level details'
    end

    describe 'GET new' do
      it 'should return http success'
    end

    describe 'GET edit' do
      it 'should return http success'
    end

    describe 'POST create' do
      it 'should create a new level record'
    end

    describe 'POST update' do
      it 'should update the level data'
    end

    describe 'DELETE destroy' do
      it 'should destroy the level record'
    end
  end

  context 'non-admin user logged in' do
    describe 'GET index ' do
      it 'should show all the levels'
    end

    describe 'GET show' do
      it 'should show the level details'
    end

    describe 'GET new' do
      it 'should return http success'
    end

    describe 'GET edit' do
      it 'should return http success'
    end

    describe 'POST create' do
      it 'should create a new level record'
    end

    describe 'POST update' do
      it 'should update the level data'
    end

    describe 'DELETE destroy' do
      it 'should destroy the level record'
    end
  end
end