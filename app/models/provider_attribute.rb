class ProviderAttribute < ApplicationRecord
  belongs_to :provider
  belongs_to :attribute_type
end
