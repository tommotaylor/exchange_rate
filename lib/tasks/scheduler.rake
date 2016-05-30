task :update_rates => :environment do
  updater = RateUpdater.new
  updater.update
end
