namespace :series do
  desc 'Gets Series Info'
  task update: :environment do
    series = Series.all

    series.each do |s|
      document = Nokogiri::XML(open(series_url + URI.encode(s.name)))
      obj = ApplicationHelper.series_to_json(document)
      obj.keys.each do |key|
        s[key] = obj[key]
      end

      if s.save
        puts s.name + ' was saved'
      else
        puts 'Error updating ' + s.name
      end
    end
  end
end
