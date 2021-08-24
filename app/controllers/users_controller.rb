class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    if user_signed_in?
      @current_user_entrie = Entry.where(user_id: current_user.id)
      @user_entrie = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @current_user_entrie.each do |cu|
          @user_entrie.each do |u|
            if cu.room_id == u.room_id then
              @room = true
              @room_id = cu.room_id
            end
          end
        end
        if @room
        else
          @room_new = Room.new
          @entrie = Entry.new
        end
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user)
  end

  def followeds
    @user = User.find(params[:id])
    @followeds = @user.follower_user
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.following_user
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end

end
