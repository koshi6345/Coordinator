class HomesController < ApplicationController
  def top
    # 下の一行で本番環境か開発環境かを判別して記述を変更している
    switch_random_function = Rails.env.production? ? "RAND()" : "RANDOM()"
    @random_posts = Post.order(switch_random_function).limit(6)
  end

  def about
  end
end
