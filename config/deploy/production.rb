set :stage, :production
set :rails_env, "production"
set :branch, 'master'

set :user, "#{fetch(:application)}"
set :domain, "api.eballance.cz"
set :deploy_to, "/home/#{fetch(:user)}/web"

server fetch(:machine), user: fetch(:user), roles: %w{web app db}

set :is_root_domain, false
set :root_domain, ""

set :default_environment, {
  "PATH" => "/home/#{fetch(:user)}/.rbenv/shims:/home/#{fetch(:user)}/.rbenv/bin:$PATH"
}
