load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

after "deploy:update_code", :roles => [:web, :db, :app] do
	run "chmod 755 #{release_path}/public"
	run "chmod 755 #{release_path}/public/dispatch.fcgi"
	run "chmod 755 #{release_path}/public/dispatch.cgi"
	run "rm -f public_html/capricornz.com"
	run "ln -s /home/waiatea2/railsapp/capricornz/current/public  ~/public_html/capricornz.com"
	run "chmod 755 public_html/capricornz.com -R" 
end

after "deploy:update", "deploy:cleanup" 

namespace :deploy do
	desc "cold deploy" 
	task :cold do
		update
		passenger::restart
	end

	desc "Restart Passenger" 
	task :restart do
		passenger::restart
	end
end

namespace :passenger do
	desc "Restart Passenger" 
	task :restart do
		run "cd #{current_path} && touch tmp/restart.txt" 
	end
end
