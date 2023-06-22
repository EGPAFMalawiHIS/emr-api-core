class PersonMergeLog < ApplicationRecord
  belongs_to :winner_person
  belongs_to :loser_person
end
