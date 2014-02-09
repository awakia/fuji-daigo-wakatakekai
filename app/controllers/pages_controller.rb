class PagesController < ApplicationController
  before_action :render_page

  Page.all.map(&:path).each do |page|
    define_method page do
      render :posts
    end
  end

  def root
    @posts =
      Post.published.where(path: :root_top).order(:published_at).reverse_order.all +
      Post.published.where(path: :whats_new).order(:published_at).reverse_order.all +
      @posts
    @side_posts = Post.published.where(path: params[:action]).order(:published_at).reverse_order
  end

  private
    def render_page
      @posts = Post.published.where(path: params[:action]).order(:published_at).reverse_order
    end
end
