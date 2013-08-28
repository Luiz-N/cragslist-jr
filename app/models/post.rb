class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category

  def self.groups
    total = Post.all
    half = total.length/2
    [total.slice(0..(half-1)), total.slice(half..-1)]
  end
end
