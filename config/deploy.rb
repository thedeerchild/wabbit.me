set :application, "wabbit.me"
set :repository,  "git@github.com:thedeerchild/wabbit.me.git"

set :use_sudo, false
set(:run_method) { use_sudo ? :sudo : :run }

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :user, "deployer"
set :group, user
set :runner, user

set :host, "#{user}@wabbit.me" # We need to be able to SSH to that box as this user.
role :web, host
role :app, host

set :deploy_to, "/home/#{user}/#{application}"
set :puma_conf, "#{deploy_to}/current/config/puma.rb"
set :puma_pid, "#{deploy_to}/tmp/puma/pid"

namespace :deploy do
  task :restart do
    run "if [ -f #{puma_pid} ]; then kill -USR2 `cat #{puma_pid}`; else cd #{deploy_to}/current && bundle exec puma --config #{puma_conf} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current && bundle exec puma --config #{puma_conf} -D"
  end
  task :stop do
    run "if [ -f #{puma_pid} ]; then kill -QUIT `cat #{puma_pid}`; fi"
  end
end