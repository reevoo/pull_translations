require "yaml"

module WTISanity
  extend self

  def check
    check_count(translations("system"), expected_count("translation"))
    check_count(translations("questionnaire"), expected_count("questionnaire_translation"))
  end

  private

  def expected_count(config_file)
    `wti status -c config/#{config_file}.yml | grep completed | wc -l`.to_i
  end

  def translations(type)
    Dir["config/locales/#{type}/*.yml"]
  end

  def check_count(files, expected)
    count = files.count
    # fail if count of pulled files is less then count of locales in webtranslateit
    fail "expected at least #{expected} files, got #{count}" if count < expected

    files.each do |file|
      count = flatten(YAML.load_file(file)).count
      fail "expected at least 1300 keys in #{file} got #{count}" unless count > 1299
    end
  end

  def flatten(h, f = [], g = {}) # rubocop:disable Naming/UncommunicativeMethodParamName
    return g.update(f => h) unless h.is_a? Hash
    h.each { |k, r| flatten(r, f + [k], g) }
    g
  end
end
