namespace :series do
  desc 'Gets Series Info'
  task update: :environment do
    Series.find_each do |item|
      SeriesJob.perform_later item.id, force: true
    end
  end
end
