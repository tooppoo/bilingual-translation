# frozen_string_literal: true

require 'translation/infrastructure'

module Translation
  module Driver
    module DriverFactory
      class << self
        include ::WatchMethod

        def use(name)
          send(name)
        end

        def deepl
          watch(
            ::Translation::Infrastructure::Driver::DeepL.free_plan(
              auth_key: Rails.configuration.x.translation.driver[:deepl][:auth_key]
            ),
            about: [:translate]
          )
        end
      end
    end
  end
end
