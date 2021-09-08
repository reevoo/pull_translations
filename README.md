# Pull Translations

Pull translations is a micro gem which handles downloading translations from WTI (webtranslateit) and check for files correctness.
It's used by Revieworld for Translation Bump process.

### Add to Gemfile
```ruby
gem 'pull_translations', git: 'https://github.com/reevoo/pull_translations'
```

### Usage
```
require 'pull_translations'

PullTranslations.run
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
