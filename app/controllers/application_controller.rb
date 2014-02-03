class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :set_csrf_cookie_for_angular
  def set_csrf_cookie_for_angular
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  include SessionsHelper

  protected
    def verified_request?
      super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    end
end
