# Delayed::Plugins::Restarter

This plugin checks memory usage of a worker process after performing every jobs.
If the worker process exceeds max memory, it will stop and execute restart command automatically.

## Requirements

* ruby 2.0+
* delayed_job 4.0+

## Installation

    $ gem install delayed-plugins-restarter

## Usage

Put your setting in config/initializers directory:

```ruby
Delayed::Worker.plugins << Delayed::Plugins::Restarter::Callback
Delayed::Plugins::Restarter.max_memory = 512
```

Options:

* max_memory: max memory of a worker process in MB

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kanety/delayed-plugins-restarter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

