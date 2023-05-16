class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index] #exceptが除く

  def index
    if params[:tag_ids]
      tags = params[:tag_ids].select {|k, v| v == "1" }.keys
      @posts = Kaminari.paginate_array(Tag.where(name: tags).map {|tag| tag.posts}.flatten).page(params[:page]).per(3)
    else
      @posts = Post.all.page(params[:page]).per(3)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save! #！マークをつけるとセーブされているかの確認
    redirect_to post_path(@post.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('explanation LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :explanation, :prefecture_id, :user_id, :address, :latitude, :longitude, tag_ids: [])
  end
end
