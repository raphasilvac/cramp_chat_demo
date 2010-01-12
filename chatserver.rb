require 'rubygems'
require 'usher'
require 'thin'
require 'cramp/controller'
require 'cramp/model'
require 'ruby-debug'
require 'active_support/all'

require 'config/routes'
require 'app/helpers/application'
require 'app/controllers/application_controller'
require 'app/controllers/chat_controller'
require 'app/controllers/retrieve_controller'
require 'app/controllers/receive_controller'
require 'app/models/chat'
require 'lib/fixes'

require 'rack'

Cramp::Model.init(YAML.load(File.read('./config/database.yml')))
Cramp::Controller::Websocket.backend = :thin
Thin::Logging.trace = true
Rack::Handler::Thin.run app_routes, :Port => 3000