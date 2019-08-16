module RubyConf
    module Year2020
      class BreakEvent < ScheduledEvent
        attr_reader :description
  
        def initialize(description:, **args)
          super(**args)
          @description = description
        end
  
        def template_name
          :'2019/schedule/_break_event'
        end
      end
    end
  end
  