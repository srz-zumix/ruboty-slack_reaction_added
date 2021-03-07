# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/slack_reaction_added/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-slack_reaction_added'
  spec.version       = Ruboty::SlackReactionAdded::VERSION
  spec.authors       = ['srz_zumix']
  spec.email         = ['']
  spec.summary       = 'Slack reaction added extention for Ruboty'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/srz-zumix/ruboty-slack_reaction_added'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.7'
  spec.add_development_dependency 'rake', '>= 12.3'
  spec.add_development_dependency 'rubocop', '>= 0.28.0'

  spec.add_dependency 'ruboty', '>= 1.1.4'
  spec.add_dependency 'slack-api', '~> 1.6'
  spec.add_dependency 'ruboty-slack_rtm', '>= 3.0'
  spec.add_dependency 'websocket-client-simple', '~> 0.3.0'
  spec.add_dependency 'faraday', '~> 0.11'
end
