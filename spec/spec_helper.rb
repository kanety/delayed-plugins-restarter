# simplecov
require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'delayed/plugins/restarter'
Delayed::Worker.plugins << Delayed::Plugins::Restarter::Callback
