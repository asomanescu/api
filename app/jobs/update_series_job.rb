class UpdateSeriesJob < ActiveJob::Base
  queue_as :default

  def perform(force: false)
    Series.find_each do |item|
      ItemWorker.new.perform item.id, force
    end
  end

  protected
  class ItemWorker
    def perform(series_id, force)
      series = Series.find series_id
      return unless force || !series.updated_today?
      document = Nokogiri::XML(open(series_url + URI.encode(series.name)))
      series_params = xml_to_json(document)

      series.update_attributes series_params
    end

    private
    def series_url
      'http://thetvdb.com/api/GetSeries.php?seriesname='
    end

    def banner_url
      'http://www.thetvdb.com/banners/'
    end

    def series_id(parsed_series)
      if parsed_series.css('seriesid').inner_text.blank?
        parsed_series.css('id').inner_text
      else
        parsed_series.css('seriesid').inner_text
      end
    end

    def xml_to_json(doc)
      parsed_series = doc.css('Series').first
      {
        id:          series_id(parsed_series),
        name:        parsed_series.css('SeriesName').inner_text,
        banner:      banner_url + parsed_series.css('banner').inner_text,
        imdb_id:     parsed_series.css('IMDB_ID').inner_text,
        overview:    parsed_series.css('Overview').inner_text.squish,
        first_aired: parsed_series.css('FirstAired').inner_text,
        fan_art:     banner_url + parsed_series.css('fanart').inner_text,
        rating:      parsed_series.css('Rating').inner_text,
        status:      parsed_series.css('Status').inner_text,
        genre:       parsed_series.css('Genre').inner_text
      }
    end
  end
end
