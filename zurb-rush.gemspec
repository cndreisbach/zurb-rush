require File.expand_path('../lib/zurb-rush/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Clinton Dreisbach"]
  gem.email         = ["crnixon@gmail.com"]
  gem.description   = %q{ZurbRush is a collection of Rails helpers and a form builder for Zurb Foundation 3.}
  gem.summary       = %q{ZurbRush is a collection of Rails helpers and a form builder for Zurb Foundation 3.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zurb-rush"
  gem.require_paths = ["lib"]
  gem.version       = ZurbRush::VERSION
  gem.add_dependency 'zurb-foundation', '~> 3.0.1'
  gem.add_dependency 'humanize', '~> 1.1.0'
  gem.add_dependency 'actionpack', '~> 3.2.1'
end
