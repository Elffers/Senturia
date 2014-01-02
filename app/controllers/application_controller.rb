class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def serve
    path = "public/resume.pdf"
    send_file( path,
    disposition: 'inline',
    type: 'application/pdf',
    x_sendfile: true )
  end 
end
