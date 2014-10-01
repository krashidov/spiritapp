class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    render json: current_user
  end
end
