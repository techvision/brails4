# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mina"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rico Sta. Cruz", "Michael Galero"]
  s.date = "2013-07-10"
  s.description = "Really fast deployer and server automation tool."
  s.email = ["rico@nadarei.co", "mikong@nadarei.co"]
  s.executables = ["mina"]
  s.files = ["bin/mina"]
  s.homepage = "http://github.com/nadarei/mina"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Really fast deployer and server automation tool."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<open4>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<open4>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<open4>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
