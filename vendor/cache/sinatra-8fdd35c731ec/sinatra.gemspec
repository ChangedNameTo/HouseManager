# -*- encoding: utf-8 -*-
# stub: sinatra 2.0.0.rc2 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra"
  s.version = "2.0.0.rc2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Blake Mizerany", "Ryan Tomayko", "Simon Rozet", "Konstantin Haase"]
  s.date = "2017-04-18"
  s.description = "Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort."
  s.email = "sinatrarb@googlegroups.com"
  s.extra_rdoc_files = ["README.de.md", "README.es.md", "README.fr.md", "README.hu.md", "README.ja.md", "README.ko.md", "README.md", "README.pt-br.md", "README.pt-pt.md", "README.ru.md", "README.zh.md", "LICENSE"]
  s.files = [".yardopts", "AUTHORS.md", "CHANGELOG.md", "CONTRIBUTING.md", "Gemfile", "LICENSE", "MAINTENANCE.md", "README.de.md", "README.es.md", "README.fr.md", "README.hu.md", "README.ja.md", "README.ko.md", "README.md", "README.pt-br.md", "README.pt-pt.md", "README.ru.md", "README.zh.md", "Rakefile", "SECURITY.md", "examples/chat.rb", "examples/simple.rb", "examples/stream.ru", "lib/sinatra", "lib/sinatra.rb", "lib/sinatra/base.rb", "lib/sinatra/images", "lib/sinatra/images/404.png", "lib/sinatra/images/500.png", "lib/sinatra/indifferent_hash.rb", "lib/sinatra/main.rb", "lib/sinatra/show_exceptions.rb", "lib/sinatra/version.rb", "sinatra.gemspec"]
  s.homepage = "http://www.sinatrarb.com/"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Sinatra", "--main", "README.rdoc", "--encoding=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Classy web-development dressed in a DSL"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, ["~> 2.0"])
      s.add_runtime_dependency(%q<tilt>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rack-protection>, ["= 2.0.0.rc2"])
      s.add_runtime_dependency(%q<mustermann>, ["~> 1.0"])
    else
      s.add_dependency(%q<rack>, ["~> 2.0"])
      s.add_dependency(%q<tilt>, ["~> 2.0"])
      s.add_dependency(%q<rack-protection>, ["= 2.0.0.rc2"])
      s.add_dependency(%q<mustermann>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<rack>, ["~> 2.0"])
    s.add_dependency(%q<tilt>, ["~> 2.0"])
    s.add_dependency(%q<rack-protection>, ["= 2.0.0.rc2"])
    s.add_dependency(%q<mustermann>, ["~> 1.0"])
  end
end
