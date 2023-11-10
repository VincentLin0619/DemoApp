class Candidate < ApplicationRecord
  validates_presence_of :name, :party, :age
end
