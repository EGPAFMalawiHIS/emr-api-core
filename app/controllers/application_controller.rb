require "application_responder"

class ApplicationController < ActionController::API
  before_action :authorize_request

  self.responder = ApplicationResponder
  respond_to :html
  include ParamConstants

  def authorize_request
    header = request.headers['Authorization']
    raise MissingToken, 'Missing token' unless header

    content = header.split(' ')
    auth_scheme = content.first
    raise MissingToken, 'Missing token' unless header
    raise InvalidToken, 'Invalid token' unless auth_scheme == 'Bearer'

    process_token(content.last)
  end

  private

  def process_token(token)
    browser = Browser.new(request.user_agent)
    decoded = Utils::JsonWebToken.decode(token:, key_supplement: browser.name + browser.version)
  end

  def decode_user(decoded)
    user = User.find_by(uuid: decoded[:user_id])
    raise InvalidToken, 'Invalid token' unless user

    User.current = user
  end
end
