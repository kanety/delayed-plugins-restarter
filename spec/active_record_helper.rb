require 'active_record'
require 'generators/delayed_job/templates/migration'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

ActiveRecord::Schema.define do
  CreateDelayedJobs.up
end
