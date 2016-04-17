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
end
