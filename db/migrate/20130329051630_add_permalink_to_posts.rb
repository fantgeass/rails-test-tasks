class AddPermalinkToPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    add_column :posts, :permalink, :string
    generate_permalinks
  end

  def down
    remove_column :posts, :permalink
  end

  private
  def generate_permalinks
    posts = Post.all
    for post in posts
      post.set_permalink_from_title
      post.save!
    end
  end
end
