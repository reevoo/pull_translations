require "wti_sanity"

module PullTranslations
  extend self

  def run
    5.times do
      begin
        system("wti pull -c config/translation.yml") || raise("Failed to pull system translations")
        system("wti pull -c config/questionnaire_translation.yml") || raise("Failed to pull questionnaire translations")
        system("wti pull config/locales/messenger/* -c config/messenger_translations.yml") || raise("Failed to pull Messenger translations")

        WTISanity.check
        break
      rescue StandardError => ex
        puts "retrying translation pull: #{ex.message}"
      end
    end
  end
end
