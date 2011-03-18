require 'bundler/capistrano'

set :application, "TWM-Website"

default_run_options[:pty] = true

set :scm, :git
set :user, 'twm'
set :repository, 'git@github.com:ThreeWiseMen/twm_website.git'
set :deploy_via, :copy
set :copy_cache, true
set :copy_exclude, ['.git/*', '.gitignore']
set :copy_compression, :bz2

set :deploy_to, "~/#{application}"
set :use_sudo, false

set :branch, "production"
set :rails_env, "production"

role :app, "74.205.99.188"
role :web, "74.205.99.188"
role :db,  "74.205.99.188", :primary => true

default_environment['PATH'] = "/home/twm/ruby-1.9.2/bin:/usr/local/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/opt/CollabNet_Subversion/bin:/home/twm/bin"

namespace :deploy do
  task :stop do
    run "cat #{deploy_to}/shared/pids/unicorn.pid* | xargs kill -s QUIT"
  end
  task :start do
    run "cd #{current_path} && bundle exec $HOME/ruby-1.9.2/bin/unicorn_rails --config-file #{current_path}/config/unicorn.#{rails_env}.conf.rb --daemonize --env #{rails_env}"
  end
  task :restart do
    run "cat #{deploy_to}/shared/pids/unicorn.pid | xargs kill -s USR2 && sleep 3s && cat #{deploy_to}/shared/pids/unicorn.pid.oldbin | xargs kill -s QUIT"
  end
end
