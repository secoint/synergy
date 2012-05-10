Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'synergy'
  s.version     = '1.1.0'
  s.summary     = 'Russian e-commerce solution based on Spree'
  s.description = ''
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Roman Smirnov'
  s.email             = 'roman@railsdog.com'
  s.homepage          = 'https://github.com/secoint/synergy'
  s.rubyforge_project = 'synergy'

  s.files        = Dir['LICENSE.txt', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'russian', '~> 0.6.0'
  #s.add_dependency('json', '>= 1.5')
  #s.add_dependency('nokogiri', '~> 1.5')
  s.add_dependency 'spree', '~> 1.0'
  #s.add_dependency('spree_static_content', '~> 0.70.0')
  #s.add_dependency('spree_editor', '~> 1.0')
  #s.add_dependency('spree_robokassa', '~> 0.50.2')
  #s.add_dependency('synergy_mainpay', '~> 0.70.1')
  s.add_dependency 'ru_propisju'
end
