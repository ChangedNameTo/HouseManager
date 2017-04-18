# -*- encoding: utf-8 -*-
# stub: sinatra-contrib 2.0.0.rc2 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra-contrib"
  s.version = "2.0.0.rc2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["https://github.com/sinatra/sinatra/graphs/contributors"]
  s.date = "2017-04-18"
  s.description = "Collection of useful Sinatra extensions"
  s.email = "sinatrarb@googlegroups.com"
  s.files = ["LICENSE", "README.md", "Rakefile", "ideas.md", "lib/sinatra/capture.rb", "lib/sinatra/config_file.rb", "lib/sinatra/content_for.rb", "lib/sinatra/contrib.rb", "lib/sinatra/contrib/all.rb", "lib/sinatra/contrib/setup.rb", "lib/sinatra/contrib/version.rb", "lib/sinatra/cookies.rb", "lib/sinatra/custom_logger.rb", "lib/sinatra/decompile.rb", "lib/sinatra/engine_tracking.rb", "lib/sinatra/extension.rb", "lib/sinatra/json.rb", "lib/sinatra/link_header.rb", "lib/sinatra/multi_route.rb", "lib/sinatra/namespace.rb", "lib/sinatra/reloader.rb", "lib/sinatra/required_params.rb", "lib/sinatra/respond_with.rb", "lib/sinatra/runner.rb", "lib/sinatra/streaming.rb", "lib/sinatra/test_helpers.rb", "lib/sinatra/webdav.rb", "sinatra-contrib.gemspec"]
  s.homepage = "http://github.com/sinatra/sinatra/tree/master/sinatra-contrib"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Collection of useful Sinatra extensions"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, ["= 2.0.0.rc2"])
      s.add_runtime_dependency(%q<mustermann>, ["~> 1.0"])
      s.add_runtime_dependency(%q<backports>, [">= 2.0"])
      s.add_runtime_dependency(%q<tilt>, ["< 3", ">= 1.3"])
      s.add_runtime_dependency(%q<rack-protection>, ["= 2.0.0.rc2"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4"])
      s.add_development_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<erubis>, [">= 0"])
      s.add_development_dependency(%q<slim>, [">= 0"])
      s.add_development_dependency(%q<less>, [">= 0"])
      s.add_development_dependency(%q<sass>, [">= 0"])
      s.add_development_dependency(%q<builder>, [">= 0"])
      s.add_development_dependency(%q<liquid>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
      s.add_development_dependency(%q<RedCloth>, ["~> 4.2.9"])
      s.add_development_dependency(%q<asciidoctor>, [">= 0"])
      s.add_development_dependency(%q<radius>, [">= 0"])
      s.add_development_dependency(%q<coffee-script>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<creole>, [">= 0"])
      s.add_development_dependency(%q<wikicloth>, [">= 0"])
      s.add_development_dependency(%q<markaby>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["< 11"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, ["= 2.0.0.rc2"])
      s.add_dependency(%q<mustermann>, ["~> 1.0"])
      s.add_dependency(%q<backports>, [">= 2.0"])
      s.add_dependency(%q<tilt>, ["< 3", ">= 1.3"])
      s.add_dependency(%q<rack-protection>, ["= 2.0.0.rc2"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.4"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<erubis>, [">= 0"])
      s.add_dependency(%q<slim>, [">= 0"])
      s.add_dependency(%q<less>, [">= 0"])
      s.add_dependency(%q<sass>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<liquid>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<RedCloth>, ["~> 4.2.9"])
      s.add_dependency(%q<asciidoctor>, [">= 0"])
      s.add_dependency(%q<radius>, [">= 0"])
      s.add_dependency(%q<coffee-script>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<creole>, [">= 0"])
      s.add_dependency(%q<wikicloth>, [">= 0"])
      s.add_dependency(%q<markaby>, [">= 0"])
      s.add_dependency(%q<rake>, ["< 11"])
      s.add_dependency(%q<rack-test>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, ["= 2.0.0.rc2"])
    s.add_dependency(%q<mustermann>, ["~> 1.0"])
    s.add_dependency(%q<backports>, [">= 2.0"])
    s.add_dependency(%q<tilt>, ["< 3", ">= 1.3"])
    s.add_dependency(%q<rack-protection>, ["= 2.0.0.rc2"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.4"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<slim>, [">= 0"])
    s.add_dependency(%q<less>, [">= 0"])
    s.add_dependency(%q<sass>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<liquid>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<RedCloth>, ["~> 4.2.9"])
    s.add_dependency(%q<asciidoctor>, [">= 0"])
    s.add_dependency(%q<radius>, [">= 0"])
    s.add_dependency(%q<coffee-script>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<creole>, [">= 0"])
    s.add_dependency(%q<wikicloth>, [">= 0"])
    s.add_dependency(%q<markaby>, [">= 0"])
    s.add_dependency(%q<rake>, ["< 11"])
    s.add_dependency(%q<rack-test>, [">= 0"])
  end
end
