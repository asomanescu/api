# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  name        :string
#  rating      :float
#  status      :string
#  first_aired :datetime
#  fan_art     :string
#  overview    :text
#  genre       :string
#  banner      :string
#  imdb_id     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Series < ActiveRecord::Base
  has_many :episodes
end
