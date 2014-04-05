# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

user = User.create(email: 'gerson@example.com', password: 'josh1234', roles: ['admin'])
user.profile = Profile.create(name: "gerson", birthdate: "19/07/1989", gender: "male", address: "kdjasldjaskjd", country: "Brazil" )
user.save!

Level.destroy_all

#adding for testing, a new seed file need to be created for production.
(1..10).to_a.each do |d|
  Level.create(:name => "level_#{d}", :seq_number => d)
end

level1 = Level.first
level2 = Level.last
level3 = Level.all[2]



def find_content(title)
  @content_data ||= Dir['db/content_*'].collect {|path| YAML.load_file(path)}
  @content_data.find{|d| d['content']['title'] == title}['content']
end

def create_topic_with_content(title, seq_number, level, content_title = nil)
  topic = Topic.create!(title: title, seq_number: seq_number, level_id: level.id)
  topic.contents.new(find_content(content_title || title)).save!(validate: false)
  topic
end

create_topic_with_content('Basics', 1, level1, 'Introduction')
create_topic_with_content('Software and Hardware', 2, level1)
create_topic_with_content('Memory', 3, level1)
create_topic_with_content('Basics', 1, level2)
create_topic_with_content('Programming Elements & Constructs', 2, level2)
create_topic_with_content('Algorithm', 3, level2)
create_topic_with_content('Introduction to Classes and Objects', 1, level3)
create_topic_with_content('OOPS Concepts', 2, level3)


def find_questions_for_topic(topic_title)
  @question_data ||= Dir['db/question_*'].collect {|path| YAML.load_file(path)}
  @question_data.find{|q| q['topic']['title'] == topic_title }['topic']['questions']
end

def add_questions_to_topic(topic_title)
  topic = Topic.where(title: topic_title).first
  questions = find_questions_for_topic(topic_title)
  if topic
    questions.each do |q| 
      question = Question.new(title: q['title'], difficulty: q['difficulty'])
      q['options'].each{|o| question.options << Option.new(o)}
      topic.questions << question
    end
    topic.save!
  end
end

add_questions_to_topic('Basics')
