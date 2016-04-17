namespace :series do
  desc 'Gets Series Info'
  task update: :environment do
    UpdateSeriesJob.new.perform
  end
end
