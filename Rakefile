require "rake"
require "rake/clean"

desc "Run tests"
task :test, [:pattern] do |spec, args|
  if args[:pattern]
    sh %{#{FileUtils::RUBY} test/#{args[:pattern]}*_test.rb}
  else
    sh %{#{FileUtils::RUBY} test/*_test.rb}
  end
end

# Default
task :default => [:test]
