require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

end
