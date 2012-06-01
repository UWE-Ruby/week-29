class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def index
    
    respond_to do |format|
      format.html { render :locals => { :posts => posts, :show_create_post => user_is_current_user? } }
      format.json { render :locals => { :posts => posts, :show_create_post => user_is_current_user? } }
    end
    
  end

  def show
  end

  def create
    post = Post.create(params[:post].merge(:user => current_user))
    Resque.enqueue(Poster,post.id)
    redirect_to posts_path
  end

  private

  def posts
    if params[:user_id]
      Post.where("user_id = ?",params[:user_id])
    else
      current_user.posts
    end
  end

  def user_is_current_user?
    if current_user and params[:user_id].nil?
      true
    elsif current_user and params[:user_id]
      current_user.id == params[:user_id].to_i
    end
  end

end
