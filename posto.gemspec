# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name = 'posto'
  gem.version = "0.1.0"
  gem.license = "GPLv3"
  gem.summary = "Sort your todo list."
  gem.description = "Sort your todo list."
  gem.homepage = "http://github.com/mattraibert/posto"
  gem.author = "Matt J Raibert"
  gem.email = 'mattraibert@gmail.com'
  gem.executables = ["posto"]
  gem.files = ["Rakefile", "README.md", "LICENSE.txt"]
  gem.files += Dir["lib/**/*"]
  gem.test_files = Dir["test/**/*"]
end
