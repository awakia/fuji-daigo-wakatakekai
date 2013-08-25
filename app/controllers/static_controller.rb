class StaticController < ApplicationController
  def index
    @posts = Post.all
  end

  def greeting
  end

  def links
  end

  def contact
  end
end
