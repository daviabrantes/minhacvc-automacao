require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc 'Execute fast scenarios'
  task :fast_scenarios do
  puts 'Running fast scenarios'
  sh 'cucumber -t @fast'
end

desc 'Execute critic scenarios'
  task :critic_scenarios do
  puts 'Running critic scenarios'
  sh 'cucumber -t @critic'
end

desc 'Execute slow scenarios'
  task :slow_scenarios do
  puts 'Running slow scenarios'
  sh 'cucumber -t @slow'
end

desc 'Execute medium scenarios'
  task :medium_scenarios do
  puts 'Running medium scenarios'
  sh 'cucumber -t @medium'
end

desc 'Execute register feature with fast scenarios'
  task :medium_scenarios do
  puts 'Running medium scenarios'
  sh 'cucumber -t ~@pull_request -t ~@search'
end