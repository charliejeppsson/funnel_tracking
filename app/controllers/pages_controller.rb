class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    cookies[:timestamp] = Time.now
    cookies[:user_id] = current_user.id
    cookies[:url] = '/'

    show_cookies
  end

  def contact
    cookies[:timestamp] = Time.now
    cookies[:user_id] = current_user.id
    cookies[:url] = '/contact'

    show_cookies
  end

  private

  def show_cookies
    @timestamp = cookies[:timestamp]
    @user_id = cookies[:user_id]
    @url = cookies[:url]
  end
end
