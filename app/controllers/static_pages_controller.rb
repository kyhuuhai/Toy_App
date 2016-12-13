class StaticPagesController < ApplicationController
	before_action :get_User ,unless: :logged_in?
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      end
  end

  def get_User
  	@user = User.all
  end

  def help
  end
end