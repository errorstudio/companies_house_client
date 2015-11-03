# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'companies_house_client/version'

Gem::Specification.new do |spec|
  spec.name          = "companies_house_client"
  spec.version       = CompaniesHouseClient::VERSION
  spec.authors       = ["Ed Jones"]
  spec.email         = ["ed@errorstudio.co.uk"]
  spec.summary       = %q{A REST client for the UK Companies House API}
  spec.description   = %q{A REST client for the UK Companies House API, including authentication}
  spec.homepage      = "https://github.com/errorstudio/companies_house_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "require_all"
  spec.add_dependency "her"

end
