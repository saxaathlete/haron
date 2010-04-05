set :application, "haron"
set :repository,  "git://github.com/saxaathlete/haron.git"

set :scm, :git
set :scm_passphrase, "saxaathleteirjlf" #This is your custom users password
set :user, "saxaathlete "
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :server, "80.91.189.60"

set :user, "haroncom"
set :password, "62608451"

server "80.91.189.60", :web, :app, :db, :primary => true

set :use_sudo, false
set :deploy_to, "/home/haroncom/haron"
set :deploy_via, :checkout

role :web, "80.91.189.60"                          # Your HTTP server, Apache/etc
role :app, "80.91.189.60"                          # This may be the same as your `Web` server
role :db,  "80.91.189.60", :primary => true # This is where Rails migrations will run
role :db,  "80.91.189.60"

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

