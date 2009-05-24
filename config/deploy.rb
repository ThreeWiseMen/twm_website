set :application, "TWM-Website"
set :repository,  "svn+ssh://cruiser@svn.threewisemen.ca/home/svn/main/twm/head/TWM-Website"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "~/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :user, "twm"
set :use_sudo, false

set :mongrel_port, "3000"
set :mongrel_address, "74.205.99.188"

task :production do
	role :app, "74.205.99.188"
	role :web, "74.205.99.188"
	role :db,  "74.205.99.188", :primary => true
end

desc "Stop the backgroundrb server"
task :stop_backgroundrb , :roles => :app do
  run "cd #{current_path} && ./script/backgroundrb stop"
end

desc "Start the backgroundrb server"
task :start_backgroundrb , :roles => :app do
  run "cd #{current_path} && RAILS_ENV=production ./script/backgroundrb start > /dev/null 2>&1"
end

desc "Start the backgroundrb server"
task :restart_backgroundrb, :roles => :app do
  stop_backgroundrb
  start_backgroundrb
end
