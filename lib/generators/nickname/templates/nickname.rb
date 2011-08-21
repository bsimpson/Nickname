class Nickname < ActiveRecord::Base
  belongs_to :nickname

  scope :for, lambda { |name| where(["nickname_id IN (SELECT nickname_id FROM nicknames WHERE name = LOWER(?))", name]) }
end
