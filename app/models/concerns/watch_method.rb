# frozen_string_literal: true

require "logging/loggable"

module WatchMethod
  extend ActiveSupport::Concern

  included do
    private def watch(obj, about:)
      watcher = Logging::Loggable.create(
        logger: Rails.logger,
        level: Rails.configuration.x.loggable.level
      )

      watcher.apply(
        to: obj,
        watch: about
      )
    end
  end
end
