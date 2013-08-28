class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts

  def self.groups
    total = Category.all
    half = total.length/2
    [total.slice(0..(half-1)), total.slice(half..-1)]
  end

  def split_posts
    posts = self.posts
    half = posts.length/2
    [posts.slice(0..(half-1)), posts.slice(half..-1)]
  end
end
