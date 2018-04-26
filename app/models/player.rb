class Player < ApplicationRecord
  has_one :player_info
  delegate :shirt_no, to: :player_info
  def to_s
    name
  end
end
