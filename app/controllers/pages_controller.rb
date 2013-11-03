class PagesController < ApplicationController
  before_action :render_page

  def root
  end

  def greeting
  end

  private
    def render_page
      @posts = Post.where(path: params[:action]).order(:published_at)
      render :posts
    end
end
