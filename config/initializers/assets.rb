# Rails.application.config.assets.precompile += %w( vendor/modernizr.js )
# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( lazysizes.min.js readmore.js custom-magellan.js )
	# Rails.application.config.assets.precompile += %w( slick.css slick-theme.css slick.min.js )
	# Rails.application.config.assets.precompile += %w( slick.eot slick.svg slick.ttf slick.woff )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
