require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  include ParamConstants
  respond_to :html

end
