class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
  end

  def dashboard
    @current_user = current_user
  end
end
