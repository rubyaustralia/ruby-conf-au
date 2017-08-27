module TwentySeventeen
  class SpeakerList
    attr_reader :speakers

    def initialize(speakers:)
      @speakers = speakers.sort{ |s1, s2| s1.slug <=> s2.slug }
    end

    def all
      speakers
    end

    def featured
      all.select(&:featured)
    end

    def timeslots(day:)
      send(day.to_sym).group_by do |speaker|
        speaker.epoch
      end
    end

    def thursday
      all.select(&:thursday).sort{|s1, s2| s1.epoch <=> s2.epoch }
    end

    def friday
      all.select(&:friday).sort{|s1, s2| s1.epoch <=> s2.epoch }
    end

    def self.load(path)
      all_speakers = YAML.load_file(path)
                      .map{ |s| TwentySeventeen::Speaker.new(**s.symbolize_keys) }
      TwentySeventeen::SpeakerList.new(speakers: all_speakers)
    end
  end
end
