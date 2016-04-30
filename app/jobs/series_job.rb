class SeriesJob < ActiveJob::Base
  def perform(series_id, force: false)
    series = Series.find series_id
    return unless force || !series.updated_today?
    document = Nokogiri::XML(open(series_url + URI.encode(series.name)))
    series_params = Series.xml_to_json(document)

    series.update_attributes! series_params
    puts "Updated #{series.name}"
    EpisodesJob.perform_later series.id
  end

  private
  def series_url
    'http://thetvdb.com/api/GetSeries.php?seriesname='
  end
end
