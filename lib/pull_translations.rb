require "wti_sanity"

module PullTranslations
  extend self

  def run
    5.times do
      run("wti pull -c config/translation.yml")
      run("wti pull -c config/questionnaire_translation.yml")
      begin
        WTISanity.check
        break
      rescue StandardError
        puts "retrying translation pull"
      end
    end

    WTISanity.check
  end
end
