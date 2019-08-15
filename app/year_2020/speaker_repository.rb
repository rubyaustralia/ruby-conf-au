module RubyConf
    module Year2020
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
  
        def via_invite
          @speakers.select { |speaker| speaker.type == "invitation" }
        end
  
        def via_cfp
          @speakers.select { |speaker| speaker.type == "cfp" }
        end
  
        def mcs
          @speakers.select { |speaker| speaker.type == "mc" }
        end
  
        private
  
        attr_reader :speakers
      end
    end
  end
  