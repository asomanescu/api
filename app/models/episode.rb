# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  name           :string
#  release_date   :date
#  season         :integer
#  episode_number :integer
#  overview       :text
#  rating         :float
#  series_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_episodes_on_series_id  (series_id)
#

class Episode < ActiveRecord::Base
  belongs_to :series

  def self.xml_to_json(document)
    {
      id:             document.css('id').inner_text.to_i,
      name:           document.css('EpisodeName').inner_text,
      season:         document.css('SeasonNumber').inner_text.to_i,
      rating:         document.css('Rating').inner_text,
      overview:       document.css('Overview').inner_text.squish,
      release_date:   document.css('FirstAired').inner_text,
      episode_number: document.css('EpisodeNumber').inner_text.to_i
    }
  end
end
