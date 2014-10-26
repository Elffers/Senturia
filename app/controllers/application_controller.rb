class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_visitor
  before_action :update_pageview_count
  before_action :update_visit_count

  def serve
    #uploader = About.last.resume
    #path = uploader.file.path
    path = 'public/resumes/resume_Oct2014.pdf'
    send_file( path,
    disposition: 'inline',
    type: 'application/pdf',
    x_sendfile: true )
  end

  def current_visitor
    if session[:visitor_id]
      @current_visitor = Visitor.find(session[:visitor_id])
    elsif cookies.permanent[:visitor_id] && Visitor.find_by(cookie_id: cookies.permanent[:visitor_id])
      @current_visitor = Visitor.find_by(cookie_id: cookies.permanent[:visitor_id])
      session[:visitor_id] = @current_visitor.id
    else
      cookies.permanent[:visitor_id] = (Time.now.nsec + rand(10000)).to_s
      @current_visitor = Visitor.create(cookie_id: cookies.permanent[:visitor_id], browser: self.find_browser)
      session[:visitor_id] = @current_visitor.id
      Browser.create(name:find_browser)
    end
    @current_visitor
    rescue ActiveRecord::RecordNotFound
      session[:visitor_id] = nil
      @current_visitor = Visitor.create(cookie_id: cookies.permanent[:visitor_id], browser: self.find_browser)
      session[:visitor_id] = @current_visitor.id
      Browser.create(name:find_browser)
  end
  helper_method :current_visitor

  def update_visit_count
    if Rails.env.development?
      unless (request.referer && request.referer.include?("localhost") )
        @current_visitor.update(visit_count: @current_visitor.visit_count + 1)
      end
    elsif Rails.env.production?
      unless (request.referer && request.referer.include?("senturia") )
        @current_visitor.update(visit_count: @current_visitor.visit_count + 1)
      end
    end
  end

  def update_pageview_count
    @current_visitor.update(pageview_visits: @current_visitor.pageview_visits + 1)
  end

  def find_browser
    @ua = request.user_agent
    if @ua.include? "Chrome"
      "Google Chrome"
    elsif @ua.include? "Safari"
      "Safari"
    elsif @ua.include? "Opera"
      "Opera"
    elsif @ua.include? "MSIE"
      "Internet Explorer"
    elsif @ua.include? "Firefox"
      "Mozilla Firefox"
    else
      "Other"
    end
  end

end
