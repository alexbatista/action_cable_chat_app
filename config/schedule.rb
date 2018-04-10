# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever
# Before execute the server, run the following command on project folder:
# whenever --update-crontab
# You can list installed cron jobs using crontab -l.

set :output, "log/cron_log.log"
set :environment, "development"
env :PATH, ENV['PATH']

every 1.minute do
  # runner "RestClient.get('http:localhost:3000/list')"
  rake "dc:run"
end
