class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    set_visitor_id
    create_cookie
  end

  def contact
    set_visitor_id
    create_cookie
  end

  private

  # TESTED:
  #  - first visit sets visitor_id correctly
  #  - first visit stores visitor record correctly in db
  #  - recurring visits sets visitor_id correctly

  # NOT TESTED:
  # - first visit from other browser than mine
  def set_visitor_id
    # if no visit cookie exists in the current browser, i.e. if it's the first visit
    # for the user, create new visitor object and set the visitor_id equal to its id
    if cookies[:visit].nil? # Rails helper function cookies[] used to store and read cookie values
      @visitor = Visitor.create
      @visitor_id = @visitor.id
    # else, if a visit cookie exists in the current browser, visitor_id is set to equal
    # the one in the latest visit cookie
    else
      latest_cookie = cookies[:visit].split(',')
      @visitor_id = latest_cookie[-1]
    end
  end

  # TESTED:
  #  - visit creates cookie correctly
  #  - visit stores visit record correctly in db

  # NOT TESTED:
  # - visit from other browser than mine
  def create_cookie
    timestamp = Time.now
    url = request.env['PATH_INFO']
    cookies.permanent[:visit] = "#{timestamp},#{url},#{@visitor_id}"
    @cookie_test = !cookies[:visit].nil?
    Visit.create(timestamp: timestamp, url: url, visitor_id: @visitor_id)
  end

end
