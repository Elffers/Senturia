class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_visitor
  before_action :update_pageview_count
  before_action :update_visit_count

  def serve
    path = "public/resume.pdf"
    send_file( path,
    disposition: 'inline',
    type: 'application/pdf',
    x_sendfile: true )
  end 

   def current_visitor
    if session[:visitor_id]
      @current_visitor = Visitor.find(session[:visitor_id])
    elsif Visitor.find_by(ip_address: request.remote_ip)
      @current_visitor = Visitor.find_by(ip_address: request.remote_ip)
      session[:visitor_id] = @current_visitor.id
    else
      @current_visitor = Visitor.create(ip_address: request.remote_ip)
      session[:visitor_id] = @current_visitor.id
    end
    @current_visitor
  end
  helper_method :current_visitor

  def update_visit_count
    unless ( request.referer && request.referer.include?("senturia") )
      @current_visitor.update(visit_count: @current_visitor.visit_count + 1)
    end
  end

  def update_pageview_count
    @current_visitor.update(pageview_visits: @current_visitor.pageview_visits + 1)
  end

end
