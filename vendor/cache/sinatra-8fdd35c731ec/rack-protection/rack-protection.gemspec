# -*- encoding: utf-8 -*-
# stub: rack-protection 2.0.0.rc2 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-protection"
  s.version = "2.0.0.rc2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["https://github.com/sinatra/sinatra/graphs/contributors"]
  s.date = "2017-04-18"
  s.description = "Protect against typical web attacks, works with all Rack apps, including Rails."
  s.email = "sinatrarb@googlegroups.com"
  s.files = ["Gemfile", "License", "README.md", "Rakefile", "lib/rack-protection.rb", "lib/rack/protection.rb", "lib/rack/protection/authenticity_token.rb", "lib/rack/protection/base.rb", "lib/rack/protection/content_security_policy.rb", "lib/rack/protection/cookie_tossing.rb", "lib/rack/protection/escaped_params.rb", "lib/rack/protection/form_token.rb", "lib/rack/protection/frame_options.rb", "lib/rack/protection/http_origin.rb", "lib/rack/protection/ip_spoofing.rb", "lib/rack/protection/json_csrf.rb", "lib/rack/protection/path_traversal.rb", "lib/rack/protection/remote_referrer.rb", "lib/rack/protection/remote_token.rb", "lib/rack/protection/session_hijacking.rb", "lib/rack/protection/strict_transport.rb", "lib/rack/protection/version.rb", "lib/rack/protection/xss_header.rb", "rack-protection.gemspec"]
  s.homepage = "http://github.com/sinatra/sinatra/tree/master/rack-protection"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Protect against typical web attacks, works with all Rack apps, including Rails."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.0.0"])
  end
end
