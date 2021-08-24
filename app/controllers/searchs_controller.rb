class SearchsController < ApplicationController

  def search
    @range = params[:range]
    if @range == "ユーザー"
      @users = User.search(params[:keyword])
      @keyword = params[:keyword]
    else
      @tags = Tag.search(params[:keyword])
      @keyword = params[:keyword]
    end
  end

end
