mv config/database.yml config/database.yml.remote
mv config/database.yml.spec config/database.yml

rails db:migrate RAILS_ENV=test

bundle exec rspec

mv config/database.yml config/database.yml.spec
mv config/database.yml.remote config/database.yml

