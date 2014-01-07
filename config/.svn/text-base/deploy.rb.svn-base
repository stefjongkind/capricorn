set :user, 'waiatear'
set :svn_username, "waiatear" 
set :server, 'waiateara.co.nz'
set :svnserver, 'waiateara.svnrepository.com'
set :application, 'capricorn'
set :applicationdir, 'railsapp/capricorn' 
set :repository, "http://#{svnserver}/svn/#{application}/" 
role :web, 'waiateara.co.nz'
role :app, 'waiateara.co.nz'

set :use_sudo, false                       # HostingRails users don\\\'t have sudo access
set :deploy_to, "/home/#{user}/#{applicationdir}" 
set:keep_releases, 5
default_run_options[:pty] = true



