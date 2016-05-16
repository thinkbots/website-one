set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'partials'

activate :directory_indexes

configure :development do
  activate :livereload
end

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  @bower_assets_path = File.join root.to_s, @bower_config['directory']
  sprockets.append_path @bower_assets_path
end

# Build-specific configuration
configure :build do
  ignore 'vendors/font-awesome/less/*'
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.deploy_method   = :rsync
  deploy.host            = 'deploy@thinkbots.io'
  deploy.path            = '/var/www/html/thinkbots'
  # deploy.user            = 'deploy'
  deploy.build_before    = true
  deploy.clean           = true
end
