class Venue < ApplicationRecord
  def display_name
    name.split(' ').map(&:capitalize).join(' ')
  end
end
