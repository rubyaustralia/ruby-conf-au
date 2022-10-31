module RubyConf
    module Year2023
      class ScheduledEvent
        include Comparable
  
        attr_reader :title, :day, :start_time, :end_time
  
        def initialize(title:, day:, start_time:, end_time:)
          @title = title
          @day = day
          @start_time = start_time
          @end_time = end_time
        end
  
        def template_name
          fail("Cannot render a ScheduledEvent")
        end
  
        def formatted_start_time
          start_time.to_s.split('').insert(-3, ":").join('')
        end
  
        def formatted_end_time
          end_time.to_s.split('').insert(-3, ":").join('')
        end
  
        def <=>(other)
          self.start_time.to_i <=> other.start_time.to_i
        end
  
        def show_title?
          true
        end
      end
    end
  end
  