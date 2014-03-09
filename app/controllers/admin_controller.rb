class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
  end

  def become_admin
    cookies[:role] = { value: 'fdw' }
    redirect_to root_path
  end
end
