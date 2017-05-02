module Delayed
  module Plugins
    class Restarter
      @@max_memory = 1024**3
      @@last_memory = nil
      @@restart_command = ->(worker) {
        identifier = worker.name.scan(/delayed_job[.]{0,1}(\d*)/).flatten.first
        commands = ["./bin/delayed_job", "restart"]
        commands << "--identifier=#{identifier}" if identifier
        commands << "--queue=#{worker.queues.join(',')}" unless worker.queues.empty?
        commands << "RAILS_ENV=#{ENV['RAILS_ENV']}" unless ENV['RAILS_ENV'].nil?
        commands.join(' ')
      }
      cattr_accessor :max_memory, :last_memory, :restart_command

      class Callback < ::Delayed::Plugin
        plugin = Delayed::Plugins::Restarter

        callbacks do |lifecycle|
          lifecycle.after(:perform) do |worker|
            mem = GetProcessMem.new
            if mem.mb > plugin.max_memory
              worker.say "restart worker process because of large memory consumption: #{mem.mb.to_i} MB."
              worker.stop
              command = plugin.restart_command.call(worker)
              worker.say "restart command: '#{command}'."
              system command
            end
            plugin.last_memory = mem.mb.to_i
          end
        end
      end
    end
  end
end

