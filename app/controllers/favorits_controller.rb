class FavoritsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorit = current_user.favorits.new(post_id: @post.id)
    favorit.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorit = current_user.favorits.find_by(post_id: @post.id)
    favorit.destroy
  end

end
