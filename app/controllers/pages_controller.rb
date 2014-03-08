class PagesController < ApplicationController
  before_action :render_page

  Page.all.each do |page|
    if page.within.present?
      define_method page.path do
        redirect_to page.within
      end
    else
      define_method page.path do
        @title = "若竹会・" + page.title
        render :posts
      end
    end
  end

  def root
    @posts =
      Post.published.where(path: :root_top).order(:published_at).reverse_order.all +
      Post.published.where(path: :info).order(:published_at).reverse_order.first(3) +
      @posts
    @side_posts = Post.published.where(path: :root_side).order(:published_at).reverse_order
  end

  private
    def render_page
      @posts = Post.published.where(path: params[:action]).order(:published_at).reverse_order
    end
end
