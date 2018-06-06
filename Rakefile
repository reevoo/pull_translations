begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

require "bundler/gem_tasks"

begin
  require "reevoocop/rake_task"
  ReevooCop::RakeTask.new(:reevoocop) do |task|
    task.options = ["-D"]
  end
  task default: :reevoocop
rescue LoadError => e
  raise(e) if ENV["RACK_ENV"] == "test"
end
