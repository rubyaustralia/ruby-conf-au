module RubyConf
  module Year2019
    class SocialEvent < ScheduledEvent
      attr_reader :description, :sponsor, :sponsor_link

      def initialize(description:, sponsor:, sponsor_link:, **args)
        super(**args)
        @description = description
        @sponsor = sponsor
        @sponsor_link = sponsor_link
      end

      def template_name
        :'2019/schedule/_social_event'
      end

      def sponsored?
        !sponsor.nil? &&
        sponsor.strip.length > 0 &&
        !sponsor_link.nil? &&
        sponsor_link.strip.length > 0
      end
    end
  end
end
