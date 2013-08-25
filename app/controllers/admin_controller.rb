class AdminController < ApplicationController
  def index
  end

  def authenticate
    if params[:key] == "password"
      Rails.cache.write("manager", expires_in: 1.hour)
      redirect_to root_path, notice: "管理者としてログインしました。"
    else
      redirect_to admin_path, notice: "パスワードが間違っています。"
    end
  end
end
