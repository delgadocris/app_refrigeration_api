require "application_responder"
class ApplicationController < ActionController::API
  include Response
  include Authenticate

  self.responder = ApplicationResponder
  respond_to :json
end
