class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:title, :image, :explanation, :prefectures)
  end
end
