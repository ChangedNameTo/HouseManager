# -*- encoding: utf-8 -*-
# stub: refile-mini_magick 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "refile-mini_magick"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jonas Nicklas"]
  s.date = "2017-04-18"
  s.email = ["jonas.nicklas@gmail.com"]
  s.files = [".gitignore", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "lib/refile/mini_magick.rb", "lib/refile/mini_magick/version.rb", "refile-mini_magick.gemspec", "spec/refile/fixtures/landscape.jpg", "spec/refile/fixtures/portrait.jpg", "spec/refile/mini_magick_spec.rb"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Image processing via MiniMagick for Refile"
  s.test_files = ["spec/refile/fixtures/landscape.jpg", "spec/refile/fixtures/portrait.jpg", "spec/refile/mini_magick_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<refile>, ["~> 0.5"])
      s.add_runtime_dependency(%q<image_processing>, ["< 1.0", ">= 0.4.1"])
      s.add_runtime_dependency(%q<mini_magick>, [">= 4.3.5"])
    else
      s.add_dependency(%q<refile>, ["~> 0.5"])
      s.add_dependency(%q<image_processing>, ["< 1.0", ">= 0.4.1"])
      s.add_dependency(%q<mini_magick>, [">= 4.3.5"])
    end
  else
    s.add_dependency(%q<refile>, ["~> 0.5"])
    s.add_dependency(%q<image_processing>, ["< 1.0", ">= 0.4.1"])
    s.add_dependency(%q<mini_magick>, [">= 4.3.5"])
  end
end
