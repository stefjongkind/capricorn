load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

after "deploy:update_code", :roles => [:web, :db, :app] do
	run "rm -f /home/waiatear/capricorn"
	run "ln -s /home/waiatear/railsapp/capricorn/current/public  /home/waiatear/capricorn"
	run "chmod 755 /home/waiatear/capricorn -R" 
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
