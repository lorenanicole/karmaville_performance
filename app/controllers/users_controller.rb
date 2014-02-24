class UsersController < ApplicationController

  # USERS_PER_PAGE = 1000

  def index
    # @users = User.by_karma.limit(50)
    # params[:page] = 0 if params[:page] == ""
    # @users = User.by_karma.page
    @users = User.page(params[:page])
  end

end
