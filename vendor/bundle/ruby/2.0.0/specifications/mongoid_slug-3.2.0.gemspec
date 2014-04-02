# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongoid_slug"
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andreas Saebjoernsen"]
  s.date = "2013-11-03"
  s.description = "Mongoid URL slug or permalink generator"
  s.email = ["andy@cosemble.com"]
  s.homepage = "https://github.com/digitalplaywright/mongoid-slug"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "mongoid_slug"
  s.rubygems_version = "2.0.3"
  s.summary = "Mongoid URL slugs"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, ["> 3.0"])
      s.add_runtime_dependency(%q<stringex>, ["~> 2.0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
      s.add_development_dependency(%q<uuid>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<mongoid>, ["> 3.0"])
      s.add_dependency(%q<stringex>, ["~> 2.0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
      s.add_dependency(%q<uuid>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<mongoid>, ["> 3.0"])
    s.add_dependency(%q<stringex>, ["~> 2.0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
    s.add_dependency(%q<uuid>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
