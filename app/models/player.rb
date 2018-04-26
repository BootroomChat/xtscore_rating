class Player < ApplicationRecord
  has_one :player_info
  delegate :shirt_no, to: :player_info
  def shirt_no_str
    if player_info.shirt_no < 10
      "0#{player_info.shirt_no}"
    else
      player_info.shirt_no.to_s
    end
  end
  def to_s
    name
  end
end
