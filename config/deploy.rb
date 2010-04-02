set :application, "set your application name here"
set :repository,  "git://github.com/saxaathlete/haron.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "193.169.188.252"                          # Your HTTP server, Apache/etc
role :app, "193.169.188.252"                          # This may be the same as your `Web` server
role :db,  "193.169.188.252", :primary => true # This is where Rails migrations will run
role :db,  "193.169.188.252"

#If you are using Passenger mod_rails uncomment this:
 #if you're still using the script/reapear helper you will need
 #these http://github.com/rails/irs_process_scripts'

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

