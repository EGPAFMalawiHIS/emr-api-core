module Helpers
  def self.to_snake_case(params)
    params.to_h.deep_transform_keys! { |key| key.to_s.underscore.to_sym }
  end
end

class OpenmrsService
  include Helpers
end

