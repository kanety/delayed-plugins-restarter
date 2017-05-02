# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed/plugins/restarter/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed-plugins-restarter"
  spec.version       = Delayed::Plugins::Restarter::VERSION
  spec.authors       = ["Yoshikazu Kaneta"]
  spec.email         = ["kaneta@sitebridge.co.jp"]

  spec.summary       = %q{A delayed_job plugin for restarting a worker process with memory limit exceeded.}
  spec.description   = %q{A delayed_job plugin for restarting a worker process with memory limit exceeded.}
  spec.homepage      = "https://github.com/kanety/delayed-plugins-restarter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "delayed_job", ">= 4.0"
  spec.add_dependency "get_process_mem"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.12.0"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "delayed_job_active_record"
end
