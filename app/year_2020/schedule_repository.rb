module RubyConf
    module Year2020
      class ScheduleRepository
        TYPE_MAP = {
          social_event: SocialEvent,
          break: BreakEvent,
          session: SessionEvent
        }
  
        def initialize(schedule:)
          @events = schedule.collect do |data|
            create(
              data.inject({}) do |memo, (key, value)|
                memo[key.to_sym] = value
                memo
              end
            )
          end
        end
  
        def for(day:)
          events.select { |event| event.day == day }
        end
  
        private
  
        attr_reader :events
  
        def create(type:, **args)
          TYPE_MAP[type.to_sym] && TYPE_MAP[type.to_sym].new(**args) || fail("Unknown scheduled event type: '#{type}'")
        end
      end
    end
  end
  