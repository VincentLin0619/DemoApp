class Candidate < ApplicationRecord
  validates_presence_of :name, :party, :age
  has_many :vote_logs
end
