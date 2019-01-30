require 'sinatra/base'
require 'sinatra/namespace'

require_relative "speaker"
require_relative "speaker_repository"

require_relative "scheduled_event"
require_relative "break_event"
require_relative "session_event"
require_relative "social_event"
require_relative "schedule_repository"

module RubyConf
  module Year2019
    module App
      def self.registered(app)
        speaker_repository = SpeakerRepository.new(
          speakers: YAML.load_file(
            File.join('app', 'year_2019', 'data', 'speakers.yml')
          ).map { |d| Speaker.new(d) }
        )
        schedule_repository = ScheduleRepository.new(
          schedule: YAML.load_file(
            File.join('app', 'year_2019', 'data', 'schedule.yml')
          )
        )

        app.register Sinatra::Namespace

        app.namespace '/2019' do
          get '/?' do
            @title            = :home
            @random_speaker   = speaker_repository.via_cfp.shuffle[0]
            @invited_speakers = speaker_repository.via_invite

            haml :"2019/home", :layout => :"2019/layout"
          end

          get '/schedule' do
            @title = 'Schedule'

            @speakers = speaker_repository
            @schedule = schedule_repository

            haml :"2019/schedule", :layout => :"2019/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name]
            @title    = page_name
            @speakers = speaker_repository

            haml :"2019/#{page_name}", :layout => :"2019/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2019::App
end
