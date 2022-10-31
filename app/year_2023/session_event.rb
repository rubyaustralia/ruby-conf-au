module RubyConf
  module Year2023
    class SessionEvent < ScheduledEvent
      attr_reader :speakers

      def initialize(speakers:, **args)
        super(**args)

        @speakers = speakers
      end

      def template_name
        :'2023/schedule/_session_event'
      end

      def show_title?
        false
      end
    end
  end
end
