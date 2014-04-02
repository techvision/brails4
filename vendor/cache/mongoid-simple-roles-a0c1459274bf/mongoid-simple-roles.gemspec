# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongoid-simple-roles"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["drefined"]
  s.date = "2014-04-01"
  s.description = "basic and simple roles system for mongoid v3"
  s.email = ["d.refined@gmail.com"]
  s.files = [".gitignore", ".travis.yml", "CHANGELOG.rdoc", "Gemfile", "LICENSE", "README.md", "Rakefile", "VERSION", "lib/mongoid-simple-roles.rb", "mongoid-simple-roles.gemspec", "mongoid.yml", "spec/mongoid-simple-roles_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "https://github.com/drefined/mongoid-simple-roles"
  s.require_paths = ["lib"]
  s.rubyforge_project = "mongoid-simple-roles"
  s.rubygems_version = "2.0.3"
  s.summary = "mongoid simple roles for sinatra"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, ["~> 4.0.0"])
      s.add_runtime_dependency(%q<bson_ext>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10.0"])
    else
      s.add_dependency(%q<mongoid>, ["~> 4.0.0"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.10.0"])
    end
  else
    s.add_dependency(%q<mongoid>, ["~> 4.0.0"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.10.0"])
  end
end
