# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Add node_modules folder to the asset load path, its location has been
# customized due to what's set in .yarnrc.
Rails.application.config.assets.paths << '/node_modules'

Rails.application.config.assets.precompile += %w[
  app/assets/builds/application.css
  app/assets/stylesheets/application.tailwind.css
  app/assets/stylesheets/active_admin.scss
  app/assets/javascripts/active_admin.js
]

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
