class AdminController < ApplicationController
  before_action :authorize_user, only: :index
  def index
    @users = User.all
    @posts = Post.all
  end

  def authorize_user
    if current_user.user_type != "admin"
      redirect_to root_path, notice: 'You shall not pass'
    end
  end

end
