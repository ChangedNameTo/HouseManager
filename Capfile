require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/bundler"
require "capistrano/rails"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
