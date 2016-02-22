# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_ldap_uac/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_ldap_uac"
  spec.version       = DeviseLdapUac::VERSION
  spec.authors       = ["David Southard","Mike Hall"]
  spec.email         = ["nacengineer@gmail.com", "mhall25@wisc.edu"]
  spec.description   = %q{UAC Bitmasks as an Array}
  spec.summary       = %q{A gem to unwrap the User Account Control Bitmask}
  spec.homepage      = "http://davesouthard.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "devise_ldap_authenticatable", '~> 0.8', '>= 0.8.1' 

  spec.add_development_dependency "bundler", "~> 1.3", ">= 1.3.0"
  spec.add_development_dependency "rake", "~>0.8.0", ">= 0.8"
end
