class FavoritsController < ApplicationController

  def create
    @posts = Post.page(params[:page]).reverse_order
    @post = Post.find(params[:post_id])
    favorit = current_user.favorits.new(post_id: @post.id)
    favorit.save
  end

  def destroy
    @posts = Post.page(params[:page]).reverse_order
    @post = Post.find(params[:post_id])
    favorit = current_user.favorits.find_by(post_id: @post.id)
    favorit.destroy
  end

end
