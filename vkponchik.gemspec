# frozen_string_literal: true

require_relative 'lib/vkponchik/version'

Gem::Specification.new do |spec|
  spec.name          = 'vkponchik'
  spec.version       = Vkponchik::VERSION
  spec.authors       = ['Vladislav Kuznecov']
  spec.email         = ['fizvlad@mail.ru']

  spec.summary       = 'API client for VK Ponchik (Keksik) donations service.'
  spec.homepage      = 'https://github.com/fizvlad/vkponchik-rb'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => 'https://github.com/fizvlad/vkponchik-rb',
    'changelog_uri' => 'https://github.com/fizvlad/vkponchik-rb/releases'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
