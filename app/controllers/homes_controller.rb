class HomesController < ApplicationController
  def top
    # 開発環境なら"RANDOM()"、本番環境なら"RAND()"じゃなきゃエラー出る
    switch_random_function = Rails.env.production? ? "RAND()" : "RANDOM()"
    @random_posts = Post.order(switch_random_function).limit(6)
  end

  def about
  end
end
