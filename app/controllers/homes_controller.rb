class HomesController < ApplicationController
  def top
    @random_posts = Post.order("RAND()").limit(6)
  end

  def about
  end
end
