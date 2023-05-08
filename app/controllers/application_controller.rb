require "application_responder"
class ApplicationController < ActionController::API
  include Response
  include Authenticate
  before_action :set_locale

  self.responder = ApplicationResponder
  respond_to :json

  def set_locale
    I18n.locale = :es
  end
end
