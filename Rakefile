require 'standalone_migrations'
require 'rake/testtask'
StandaloneMigrations::Tasks.load_tasks

Rake::TestTask.new(:test) do |t|
  t.warning = true
end
