class FormField < ApplicationRecord
  belongs_to :form
  belongs_to :field
end
