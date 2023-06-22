class User < ApplicationRecord
  belongs_to :system
  belongs_to :person
end
