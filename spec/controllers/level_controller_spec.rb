require 'spec_helper'

describe LevelController do
  context 'non-admin user' do
    it 'enables the bonus round questions when the user finishes all the level topics'
    it 'does not allow an user to reach a topic before reading all the topics before it'
    it 'can view a level'
    it 'can access a topic'
  end

  context 'admin-user' do
    it 'can create a new level'
    it 'can edit a level'
    it 'can delete a level'
  end
end
