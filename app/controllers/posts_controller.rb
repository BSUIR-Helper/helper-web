class PostsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  before_action :load_post, only: [:show, :edit, :update, :destroy]
  before_action :load_disciplines, only: [:new, :create, :edit, :update]
  before_action :build_post, only: [:new, :create]

  def index
    @posts = policy_scope(Post)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @post.attributes = post_params
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private

    def build_post
      @post = Post.new
      authorize @post
    end

    def load_post
      @post = Post.find(params[:id])
      authorize @post
    end

    def load_disciplines
      @disciplines = Discipline.all
    end

    def post_params
      params.require(:post).permit(:title, :discipline_id, :description)
    end
end
