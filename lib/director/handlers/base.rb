# TEST: individual handlers work when a target_path is present
# TEST: individual handlers work when only a target is present
# TEST: individual handlers can redirect to "" without looping indefinitely

module Director
  module Handler
    class Base
      attr_reader :alias_entry

      def self.for(alias_entry)
        return Director::Handler::Passthrough unless alias_entry
        alias_entry.handler_class
      end

      def initialize(alias_entry)
        @alias_entry = alias_entry
      end

      def response(app, env)
        raise NotImplementedError
      end

      private

      def target_path
        alias_entry.effective_target_path
      end
    end
  end
end
