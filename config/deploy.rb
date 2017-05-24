# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "HouseManager"
set :repo_url, "git@gitlab.com:william.m95/HouseManager.git"
set :branch, :master
set :deploy_to, "/home/will/HouseManager"
set :pty, true
set :ssh_options, {
  forward_agent: true,
  keys: %(~/.ssh/)
}
