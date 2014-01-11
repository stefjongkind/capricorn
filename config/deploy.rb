set :user, 'waiatea2'
role :web, 'capricornz.com'
role :app, 'capricornz.com'
role :db,  'capricornz.com', :primary => true
set :applicationdir, "railsapp/capricornz"
ssh_options[:forward_agent] = true  
set :repository, "git@github.com:stefjongkind/capricornz.git"  # Your clone URL
set :scm, "git"
set :scm_user, "stefjongkind"
set :scm_password, Proc.new { CLI.password_prompt "SVN Password: "}
set :branch, "master"
set :use_sudo, false                       # HostingRails users don\\\'t have sudo access
set :deploy_to, "/home/#{user}/#{applicationdir}" 

set:keep_releases, 5
set :group_writable, false
default_run_options[:pty] = true
set :deploy_via, :remote_cache
