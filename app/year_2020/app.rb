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
  module Year2020
    module App
      def self.registered(app)
        speaker_repository = SpeakerRepository.new(
          speakers: YAML.load_file(
            File.join('app', 'year_2020', 'data', 'speakers.yml')
          ).map { |d| Speaker.new(d) }
        )
        schedule_repository = ScheduleRepository.new(
          schedule: YAML.load_file(
            File.join('app', 'year_2020', 'data', 'schedule.yml')
          )
        )
        app.register Sinatra::Namespace

        app.namespace '/2020' do
            get '/?' do
                @title = 'Home'
                # @random_speaker   = speaker_repository.via_cfp.shuffle[0]
                # @invited_speakers = speaker_repository.via_invite
                haml :"2020/home", :layout => :"2020/layout"
            end

            get '/schedule' do
                @title = 'Schedule'
                @speakers = speaker_repository
                @schedule = schedule_repository

                haml :"2020/schedule", :layout => :"2020/layout"
            end

            get '/:page_name' do
                page_name = params[:page_name]
                @title = page_name.gsub(/[-]/, ' ')
                @speakers = speaker_repository
                
                haml :"2020/#{page_name}", :layout => :"2020/layout"
            end
        end
      end
    end
  end

  Sinatra.register Year2020::App
end
