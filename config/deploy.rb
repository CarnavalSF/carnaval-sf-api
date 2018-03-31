require 'mina/deploy'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/puma'
require 'mina/scp'
require 'highline/import'

require_relative 'deploy/essentials'
require_relative 'deploy/setup'
require_relative 'deploy/imagemagick'
require_relative 'deploy/postgresql'
require_relative 'deploy/nodejs'
require_relative 'deploy/rbenv'
require_relative 'deploy/puma'
require_relative 'deploy/nginx'
require_relative 'deploy/secrets'

set :user, 'ubuntu'
set :domain, 'ec2-54-152-58-182.compute-1.amazonaws.com'
set :identity_file, '~/pem/carnaval.pem'

set :app_name, 'carnaval'
set :app_root, '/Users/codyeatworld/projects/rails/sf-carnaval'
set :template_path, "#{fetch(:app_root)}/config/deploy/templates"

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:app_name)}"

set :repository, 'git://github.com/codyeatworld/sf-carnaval-rails'
set :branch, 'master'

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml')

task :environment do
  invoke :'rbenv:load'
end

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    invoke :'rbenv:load'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'rbenv:load'
      invoke :'puma:stop'
      invoke :'puma:start'
    end
  end
end
