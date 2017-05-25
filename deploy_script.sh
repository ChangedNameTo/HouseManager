ps aux | egrep -i 'puma' | awk '{print $2}' | xargs kill
git pull
bundle install
rails db:migrate RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
rails s -e production -p 3000 -b 107.170.25.73 -d
