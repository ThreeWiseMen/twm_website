require 'bundler/capistrano'

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                               # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2@twm'                      # Or whatever env you want it to run in.
set :rvm_type, :user

default_run_options[:pty] = true

set :application, "TWM-Website"
set :repository, 'git@github.com:ThreeWiseMen/twm_website.git'

set :deploy_to, "~/#{application}"

set :scm, :git

set :deploy_via, "remote_cache"

set :user, 'twm'
set :use_sudo, false


task :production do
  role :app, "209.15.242.226"
  role :web, "209.15.242.226"
  role :db,  "209.15.242.226", :primary => true
  set :branch, "production"
  set :rails_env, "production"
  default_environment['PATH'] = "/home/twm/.rvm/gems/ruby-1.9.2-p180/bin:/home/twm/.rvm/gems/ruby-1.9.2-p180@global/bin:/home/twm/.rvm/rubies/ruby-1.9.2-p180/bin:/home/twm/.rvm/bin:/usr/local/pgsql/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin"
  default_environment['LD_LIBRARY_PATH'] = "/usr/local/pgsql-8.4/lib:/usr/local/lib:/usr/lib"
end

namespace :deploy do
  task :stop do
    run "cat #{deploy_to}/shared/pids/unicorn.pid* | xargs kill -s QUIT"
  end
  task :start do
    run "cd #{current_path} && bundle exec unicorn_rails --config-file #{current_path}/config/unicorn.#{rails_env}.conf.rb --daemonize --env #{rails_env}"
  end
  task :restart do
    run "cat #{deploy_to}/shared/pids/unicorn.pid | xargs kill -s USR2 && sleep 3s && cat #{deploy_to}/shared/pids/unicorn.pid.oldbin | xargs kill -s QUIT"
  end
end
