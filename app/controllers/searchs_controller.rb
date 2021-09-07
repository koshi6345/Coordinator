class SearchsController < ApplicationController
  def search
    @range = params[:range]
    if @range == "ユーザー"
      @users = User.search(params[:keyword])
      @keyword = params[:keyword]
    elsif @range == "タグ"
      @tags = Tag.search(params[:keyword])
      @keyword = params[:keyword]
    else
      @posts = Post.all
      @posts.each do |post_one|
        @image_color = Magick::ImageColors.new(post_one.image)
      end
      @image_colors = @image_color.colors
      @keyword = params[:keyword]
    end
  end
end
