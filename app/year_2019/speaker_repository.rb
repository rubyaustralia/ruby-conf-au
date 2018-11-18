module RubyConf
  module Year2019
    class SpeakerRepository
      def initialize(speakers:)
        @speakers = speakers
      end

      def find(name:)
        speakers.find do |speaker|
          speaker.name.downcase == name.downcase
        end
      end

      def all
        @speakers
      end

      private
      attr_reader :speakers
    end
  end
end
