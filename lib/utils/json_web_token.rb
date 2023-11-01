# frozen_string_literal: true

# The Utils module serves as a namespace for utility classes and modules.
module Utils
  # The JsonWebToken module provides methods for encoding and decoding JWT tokens.
  module JsonWebToken
    # Using the singleton pattern here allows us to use the methods as class methods.
    class << self
      # SECRET_KEY is the base secret key used for encoding and decoding JWT tokens.
      # It is fetched from the Rails application secrets.
      SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

      # The encode method is used to encode a payload into a JWT token.
      # @param payload [Hash] the data to be encoded into the JWT token.
      # @param key_supplement [String] a string to be appended to the SECRET_KEY for encoding.
      # @param exp [Time] the expiration time of the token. Defaults to 4 hours from the current time.
      # @return [String] the encoded JWT token.
      def encode(payload:, key_supplement:, exp: 4.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY + key_supplement)
      end

      # The decode method is used to decode a JWT token into a payload.
      # @param token [String] the JWT token to be decoded.
      # @param key_supplement [String] a string to be appended to the SECRET_KEY for decoding.
      # @return [HashWithIndifferentAccess] the decoded payload.
      def decode(token:, key_supplement:)
        decoded = JWT.decode(token, SECRET_KEY + key_supplement)[0]
        HashWithIndifferentAccess.new decoded
      end
    end
  end
end
