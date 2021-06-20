# frozen_string_literal: true

module Logging
  module Loggable
    class << self
      def info(logger:)
        create(logger: logger, level: :info)
      end
      def create(logger:, level:)
        LoggableDecorator.new(logger, level)
      end
    end

    class LoggableDecorator
      def initialize(logger, level)
        @logger = logger
        @level = level
      end

      def apply(to:, watch:)
        receiver = to

        watch.each do |m|
          original_method = receiver.method(m)

          logger = @logger
          level = @level

          receiver.singleton_class.define_method m do |*args|
            logger.send level, ({ parameters: args })

            result = case args
                     in [*pos, keywords] if keywords.is_a? Hash
                       original_method.call *pos, **keywords
                     else
                       original_method.call *args
                     end

            result.tap do |r|
              logger.send level, ({ return: r })
            end
          end
        end

        receiver
      end
    end
  end
end
