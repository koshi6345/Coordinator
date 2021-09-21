class HomesController < ApplicationController
  def top
    # 開発環境なら"RANDOM()"、本番環境なら"RAND()"じゃなきゃエラー出る
    @random_posts = Post.order("RAND()").limit(6)
  end

  def about
  end
end
