class EpisodesJob < ActiveJob::Base
  def perform(series_id)
    series = Series.find series_id

    document = Nokogiri::XML(open(episodes_url(series_id)))

    series_params = Series.xml_to_json(document)
    series.update_attributes! series_params

    document.css('Episode').each do |episode_xml|
      next if episode_xml.css('SeasonNumber').inner_text.to_i < 1

      episode_params = Episode.xml_to_json(episode_xml)
      episode = series.episodes.find_or_create_by(id: episode_params[:id])

      episode.update_attributes! episode_params
      puts "Updated Episode #{episode.episode_number}:#{episode.season} from #{series.name}"
    end
  end

  private
  def episodes_url(series_id)
    "http://thetvdb.com/api/#{Rails.application.secrets.api_key}/series/#{series_id}/all/en.xml"
  end
end
