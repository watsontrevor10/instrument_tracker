class Instrument < ApplicationRecord
  belongs_to :user

  #validates :name { not_nil}
end
