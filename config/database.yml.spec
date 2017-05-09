default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: housemanager_development

test:
  <<: *default
#  host: postgres
  database: housemanager_test
#  username: runner

production:
  <<: *default
  database: housemanager_production
  username: will
  password: <%= ENV['HOUSEMANAGER_DATABASE_PASSWORD'] %>
