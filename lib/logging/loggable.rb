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

          receiver_name = "#{receiver.class}##{m.to_s}"

          receiver.singleton_class.define_method m do |*args|
            result = case args
                     in [*pos, keywords] if keywords.is_a? Hash
                       original_method.call *pos, **keywords
                     else
                       original_method.call *args
                     end

            result.tap do |r|
              logger.send level, ({
                receiver: receiver_name,
                parameters: args,
                return: r,
              })
            end
          rescue => e
            logger.error({
              receiver: receiver_name,
              parameters: args,
              raise: e,
            })

            raise e
          end
        end

        receiver
      end
    end
  end
end
