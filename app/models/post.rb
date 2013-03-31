class Post < ActiveRecord::Base
  attr_accessible :permalink, :title
  before_create :set_permalink_from_title

  def self.get_unique_permalink(string)
    i = 2
    permalink = string
    while exists?(permalink: permalink)
      permalink = "#{string}_#{i}"
      i += 1
    end

    return permalink
  end

  def set_permalink_from_title
    self.permalink = self.class.get_unique_permalink(title.parameterize)
  end

end
