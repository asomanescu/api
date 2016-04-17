namespace :series do
  desc 'Gets Series Info'
  task update: :environment do
    UpdateSeriesJob.new.perform
  end

  task episdes: :environment do
    
  end
end
