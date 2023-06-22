class Note < ApplicationRecord
  belongs_to :patient
  belongs_to :obs
  belongs_to :encounter
end
