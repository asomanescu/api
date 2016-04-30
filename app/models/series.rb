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

  def updated_today?
    updated_at.today?
  end

  def self.xml_to_json(document)
    parsed_series = document.css('Series').first
    {
      id:          self.series_id(parsed_series),
      name:        parsed_series.css('SeriesName').inner_text,
      banner:      banner_url + parsed_series.css('banner').inner_text,
      imdb_id:     parsed_series.css('IMDB_ID').inner_text,
      overview:    parsed_series.css('Overview').inner_text.squish,
      first_aired: parsed_series.css('FirstAired').inner_text,
      fan_art:     self.banner_url + parsed_series.css('fanart').inner_text,
      rating:      parsed_series.css('Rating').inner_text,
      status:      parsed_series.css('Status').inner_text,
      genre:       parsed_series.css('Genre').inner_text
    }
  end

  private

  def self.series_id(series_xml)
    if series_xml.css('seriesid').inner_text.blank?
      series_xml.css('id').inner_text
    else
      series_xml.css('seriesid').inner_text
    end
  end

  def self.banner_url
    'http://www.thetvdb.com/banners/'
  end
end
