class Player < ApplicationRecord
  has_one :player_info
  delegate :shirt_no, to: :player_info

  def to_s
    name
  end

  def last_name
    @last_name = name.split(' ')
    @last_name.shift if @last_name.size > 1
    @last_name.join(" ")
  end
end
