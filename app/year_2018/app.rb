require 'sinatra/base'
require 'sinatra/namespace'

module RubyConf
  module Year2018

    class Page
      attr_reader :name

      def initialize(name, path, active_class: 'active')
        @name = name
        @path = path
        @active_class = active_class
      end

      def navigation_class_for(other_path)
        matches?(other_path) && active_class || ''
      end

      def matches?(other_path)
        path == other_path
      end

      private
      attr_reader :path, :active_class
    end

    class Speaker
      def initialize(data)
        @data = data
      end

      def title
        data['title']
      end

      def is_sponsored?
        !data['sponsor'].nil?
      end

      def sponsor_image_filename
        "/2018/images/sponsors/#{data['sponsor']}.png"
      end

      def name
        data['name']
      end

      def long_name?
        name.length > 20
      end

      def first_name
        data['name'].split(' ', 2).first
      end

      def last_name
        data['name'].split(' ', 2).last
      end

      def avatar_filename(format: 'png')
        fn = name.downcase.gsub(' ', '-')
        "/2018/images/speakers/#{fn}.#{format}"
      end

      def bio
        data['bio']
      end

      def pitch
        data['pitch']
      end

      def has_twitter?
        !twitter.nil? && twitter.length > 0
      end

      def twitter
        data["twitter"] && data["twitter"].strip
      end

      def is_keynote?
        data["pitch"].strip.downcase == 'keynote' || data["pitch"].nil?
      end

      def compact_sponsor?
        !!data['compact_sponsor']
      end

      private
      attr_reader :data
    end

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

    class ScheduledEvent
      include Comparable

      attr_reader :title, :start_time, :end_time

      def initialize(title:, start_time:, end_time:)
        @title = title
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

    class SocialEvent < ScheduledEvent
      attr_reader :description

      def initialize(description:, **args)
        super(**args)
        @description = description
      end

      def template_name
        :'2018/schedule/_social_event'
      end
    end

    class BreakEvent < ScheduledEvent
      attr_reader :description

      def initialize(description:, **args)
        super(**args)
        @description = description
      end

      def template_name
        :'2018/schedule/_break_event'
      end
    end

    class SessionEvent < ScheduledEvent
      attr_reader :speakers

      def initialize(speakers:, **args)
        super(args)
        @speakers = speakers
      end

      def template_name
        :'2018/schedule/_session_event'
      end

      def show_title?
        false
      end
    end

    class ScheduledEventFactory
      def self.create(type:, **args)
        TYPE_MAP[type.to_sym] && TYPE_MAP[type.to_sym].new(**args) || fail("Unknown scheduled event type: '#{type}'")
      end

      private
      TYPE_MAP = {
        social_event: SocialEvent,
        break: BreakEvent,
        session: SessionEvent
      }
    end

    module HashUtils
      def self.symbolize_keys(hash)
        hash.dup.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
      end
    end

    module App
      def self.registered(app)
        speaker_repository = SpeakerRepository.new(speakers: YAML.load_file(File.join('app', 'year_2018', 'data', 'speakers.yml')).map{ |d| Speaker.new(d) })
        schedule_data = YAML.load_file(File.join('app', 'year_2018', 'data', 'schedule.yml'))

        app.register Sinatra::Namespace

        app.namespace '/2018' do
          get '/?' do
            @title = :home
            random_speaker = YAML.load_file(File.join('app', 'year_2018', 'data', 'speakers.yml'))[1..-1].shuffle.first
            @speaker = Speaker.new(random_speaker)
            @page = Page.new(:home, '/')
            haml :"2018/home", :layout => :"2018/layout"
          end

          get '/schedule' do
            @page = Page.new(:schedule, request.path)
            @speaker_repository = speaker_repository
            @wednesday = schedule_data['wednesday'].map{ |d| ScheduledEventFactory.create(**HashUtils.symbolize_keys(d)) }.sort
            @thursday = schedule_data['thursday'].map{ |d| ScheduledEventFactory.create(**HashUtils.symbolize_keys(d)) }.sort
            @friday = schedule_data['friday'].map{ |d| ScheduledEventFactory.create(**HashUtils.symbolize_keys(d)) }.sort
            @saturday = schedule_data['saturday'].map{ |d| ScheduledEventFactory.create(**HashUtils.symbolize_keys(d)) }.sort
            haml :"2018/schedule", :layout => :"2018/layout"
          end

          get '/:page_name' do
            page_name = params[:page_name].underscore
            @title = page_name
            @speakers = speaker_repository.all
            @page = Page.new(page_name, request.path)
            haml :"2018/#{page_name}", :layout => :"2018/layout"
          end
        end
      end
    end
  end

  Sinatra.register Year2018::App
end
