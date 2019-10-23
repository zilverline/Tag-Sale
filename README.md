05-13-19 PT Jamie Vullo Rails Project

# Tag Sale
A simple Item for Sale posting web application/content management system made using the Rails gem with ActiveRecord and the Ruby programming language. 

## Table of Contents
* Description
* Technologies
* Setup
* Resources
* License

### Description
This is a small web application that allows Users to signup and list items for sale by category. 

### Technologies
This application utilizes the Ruby Programming language and several gems (listed)
ruby '2.6.1'
* gem 'rails', '~> 6.0.0'
* gem 'sqlite3', '~> 1.4'
* gem 'puma', '~> 3.11'
* gem 'sass-rails', '~> 5'
* gem 'webpacker', '~> 4.0'
* gem 'turbolinks', '~> 5'
* gem 'jbuilder', '~> 2.7'
* gem 'redis', '~> 4.0'
* gem 'bcrypt'
* gem 'image_processing', '~> 1.2'
* gem 'bootsnap', '>= 1.4.2', require: false
* gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
* gem 'web-console', '>= 3.3.0'
* gem 'listen', '>= 3.0.5', '< 3.2'
* gem 'spring'
* gem 'spring-watcher-listen', '~> 2.0.0'
* gem 'capybara', '>= 2.15'
* gem 'selenium-webdriver'
* gem 'webdrivers'
* gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
* gem 'bootstrap'
* gem 'omniauth'
* gem 'omniauth-facebook'
* gem 'dotenv-rails'

### Setup
* To run this web application you must clone it from git@github.com:jamievullo/Tag-Sale.git goto https://github.com/jamievullo/Tag-Sale copy and clone into your terminal.
* On command line type: git clone git@github.com:jamievullo/Tag-Sale.git
* cd Tag-Sale
* Run bundle install
* Run rails db:migrate
* Run rails s from the command line
* Goto localhost:3000 in your browser
* Signup for app by creating a Username, Password and entering valid email address.
* Start entering items you would like to sell, edit them if you wish, or browse to see if there   is anything listed that'll pique your interest. 

### Sources and Resources Used
* http://learn.co
* https://rubygems.org
* https://stackoverflow.com x 1000 ;)
* https://www.favicon-generator.org
* https://css-tricks.com/snippets/css/a-guide-to-flexbox/

### License
* MIT License

### Possible Future Changes or upgrades
* email "masking" for anonymity
* "Tag Sale Inc." lists your items for sale across all online marketplaces and              platforms.(facebook marketplace,  craigslist, ebay, amazon(if new), etc.) We 
   are the professionals!!
* Shopping Cart function
* Paypal Omniauth
* Seller Rating or feedback
