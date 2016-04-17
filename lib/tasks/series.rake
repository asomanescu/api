namespace :series do
  desc 'Gets Series Info'
  task update: :environment do
    UpdateSeriesJob.perform_async(force: true)
  end

  task episdes: :environment do
    
  end
end
