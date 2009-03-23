require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "activewarehouse-etl"
    gem.summary = "Pure Ruby ETL package."
    gem.description = <<-EOF
        ActiveWarehouse ETL is a pure Ruby Extract-Transform-Load application for loading data into a database.
    EOF
    gem.email = "casey.colin@gmail.com"
    gem.homepage = "http://github.com/colincasey/activewarehouse-etl"
    gem.authors = ["Anthony Eden"]

    gem.add_dependency('rake',               '>= 0.8.3')
    gem.add_dependency('activesupport',      '>= 2.1.0')
    gem.add_dependency('activerecord',       '>= 2.1.0')
    gem.add_dependency('fastercsv',          '>= 1.2.0')
    gem.add_dependency('adapter_extensions', '>= 0.5.0')
    gem.add_dependency('roo',                '>= 1.2.3')
    gem.add_dependency('colincasey-sequel',  '>= 2.10.4')

    gem.files = FileList["CHANGELOG", "LICENSE", "README", "TODO", "Rakefile", "VERSION.yml", "bin/**/*", "lib/**/*"]
    gem.require_path = 'lib'

    gem.bindir = "bin"
    gem.executables = ['etl']
    gem.default_executable = "etl"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActiveWarehouse ETL'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
rescue LoadError
  puts "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
end

desc "uninstall"
task :uninstall do
  command = "gem uninstall activewarehouse-etl"
  unless RUBY_PLATFORM =~ /(win|w)32$/
    command = "sudo #{command}"
  end
  puts "Executing #{command.inspect}:"
  sh command
end

desc "reinstall"
task :reinstall => [:uninstall, :gemspec, :build, :install]

task :default => :test
