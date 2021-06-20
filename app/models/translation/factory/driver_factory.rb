# frozen_string_literal: true

module Translation
  module Factory
    module DriverFactory
      class << self
        require 'translation/infrastructure'

        def use(name)
          send(name)
        end

        def deepl
          Translation::Infrastructure::Driver::DeepL.free_plan(
            auth_key: Rails.configuration.x.translation.driver[:deepl][:auth_key]
          )
        end
      end
    end
  end
end
