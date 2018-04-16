# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','herd_cats','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'herd_cats'
  s.version = HerdCats::VERSION
  s.author = 'Jillian Evin'
  s.email = 'jilucev7@gmail.com'
  s.homepage = 'https://ca.linkedin.com/in/jillian-evin-6a741194'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A command line app that finds gps information for a dir of images and prints to a csv'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','herd_cats.rdoc']
  s.rdoc_options << '--title' << 'herd_cats' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'herd_cats'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.17.1')
end
