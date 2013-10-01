class Topic
  include Mongoid::Document

  belongs_to :level
  has_many :contents

  embeds_many :questions, as: :questionable

end
