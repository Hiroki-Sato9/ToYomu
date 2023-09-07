class ApplicationController < ActionController::Base
  include SessionsHelper

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      flash[:danger] = "P;ease log in"
      redirect_to login_url, status: :see_other
    end
  end
end
