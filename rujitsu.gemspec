# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name = "rujitsu"
  spec.version = "0.4.0"
  spec.date = "2010-06-03"
  spec.authors = ["Brightbox Systems Ltd", "Caius Durling", "Rahoul Baruah"]
  spec.email = %q{hello@brightbox.co.uk}

  spec.summary = %q{Various helper methods to smooth over Ruby development}
  spec.description = %q{Various helper methods to smooth over Ruby development}
  spec.homepage = %q{http://github.com/brightbox/rujitsu}
  spec.license = "MIT"

  spec.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/rujitsu.rb", "lib/rujitsu/all.rb", "lib/rujitsu/fixnum.rb", "lib/rujitsu/grammar.rb", "lib/rujitsu/inspect.rb", "lib/rujitsu/numeric.rb", "lib/rujitsu/object.rb", "lib/rujitsu/range.rb", "lib/rujitsu/string.rb", "lib/ujitsu.rb"]
  spec.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rujitsu", "--main", "README.rdoc"]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop"
end
