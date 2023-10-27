# This function permits the given parameters and transforms the keys to snake_case symbols
# @param args [Array<Symbol>] the parameters to permit
# @return [ActionController::Parameters] the permitted parameters with snake_case keys

ActionController::Parameters.prepend(Module.new do
  def permit(*args)
    super.tap do |permitted|
      permitted.transform_keys! { |key| key.to_s.underscore.to_sym }
    end
  end
end)