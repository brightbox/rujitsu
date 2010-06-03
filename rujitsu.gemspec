# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rujitsu}
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brightbox Systems Ltd"]
  s.date = %q{2010-06-03}
  s.description = %q{Various helper methods to smooth over Ruby development}
  s.email = %q{hello@brightbox.co.uk}
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/rujitsu.rb", "lib/rujitsu/all.rb", "lib/rujitsu/fixnum.rb", "lib/rujitsu/grammar.rb", "lib/rujitsu/inspect.rb", "lib/rujitsu/numeric.rb", "lib/rujitsu/object.rb", "lib/rujitsu/range.rb", "lib/rujitsu/string.rb", "lib/ujitsu.rb", "tasks/rspec.rake"]
  s.files = ["CHANGELOG", "README.rdoc", "Rakefile", "lib/rujitsu.rb", "lib/rujitsu/all.rb", "lib/rujitsu/fixnum.rb", "lib/rujitsu/grammar.rb", "lib/rujitsu/inspect.rb", "lib/rujitsu/numeric.rb", "lib/rujitsu/object.rb", "lib/rujitsu/range.rb", "lib/rujitsu/string.rb", "lib/ujitsu.rb", "rujitsu.gemspec", "spec/fixnum_spec.rb", "spec/numeric_spec.rb", "spec/object_spec.rb", "spec/range_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/string_spec.rb", "tasks/rspec.rake", "Manifest"]
  s.homepage = %q{http://github.com/brightbox/rujitsu}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rujitsu", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rujitsu}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Various helper methods to smooth over Ruby development}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
