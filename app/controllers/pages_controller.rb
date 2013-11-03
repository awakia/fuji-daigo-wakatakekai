class PagesController < ApplicationController
  before_action :render_page

  Page.all.map(&:path).each do |page|
    define_method page do
      # do noting
    end
  end

  private
    def render_page
      @posts = Post.published.where(path: params[:action]).order(:published_at)
      render :posts
    end
end
