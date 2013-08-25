class StaticController < ApplicationController
  def index
    @posts = Post.order(:published_at).all
  end

  def greeting
  end

  def links
  end

  def contact
  end
end
