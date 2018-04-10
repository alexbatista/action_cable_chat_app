namespace :dc do
  desc "TODO"
  task :run => :environment do
    t = RestClient.get('http://localhost:3000/list')
    puts "#{Time.now} - Success!" + t.to_s
  end
end
