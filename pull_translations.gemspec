Gem::Specification.new do |s|
  s.name        = "pull_translations"
  s.version     = "0.1.2"
  s.platform    = Gem::Platform::RUBY
  s.author      = "developers@reevoo.com"
  s.email       = "developers@reevoo.com"
  s.description = "Pull system and questionnaire translations"
  s.summary = "Pull system and questionnaire translations. Used in Reevoo applications like RW, Filler, AAO"

  s.files         = ["lib/wti_sanity.rb", "lib/pull_translations.rb"]
  s.require_paths = ["lib"]
  s.license       = "MIT"
  s.add_dependency "web_translate_it", ["~> 2"]
  s.add_development_dependency "rake"
  s.add_development_dependency "reevoocop"
end
