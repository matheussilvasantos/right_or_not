require "rack"
require "rack/contrib"

require_relative "./web"

run Sinatra::Application
