class PostsController < ApplicationController
  impressionist actions: [:index, :show]

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def new
    @post =  Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:names].split(",")
    @post.user_id = current_user.id
    if @post.save
      @post.tags_save(tag_list)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = @post.user
    impressionist(@post, nil, unique: [:impressionable_id, :ip_address])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def sort
    selection = params[:keyword]
    @posts = Kaminari.paginate_array(Post.sort(selection)).page(params[:page])
    @value = params[:keyword]
  end

  private

  def post_params
    params.require(:post).permit(:image, :introduction)
  end

end