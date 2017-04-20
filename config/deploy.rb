# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "HouseManager"
set :repo_url, "git@gitlab.com:william.m95/HouseManager.git"
set :branch, :master
set :deploy_to, "/home/will/HouseManager"
set :pty, true
set :linked_files, %w{config/database.yml config/secrets.yml config/google_service_account_credentials.json}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :ssh_options, {
  forward_agent: true,
  use_agent: false,
  keys: %(~/.ssh/)
}
