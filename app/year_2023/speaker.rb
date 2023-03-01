require "redcarpet"

module RubyConf
  module Year2023
    class Speaker
      def initialize(data)
        @data = data
      end

      def title
        data['title']
      end

      def type
        data["type"] || "cfp"
      end

      def is_sponsored?
        !data['sponsor'].nil?
      end

      def sponsor_image_filename
        "/2023/images/sponsors/#{data['sponsor']}.png"
      end

      def name
        data['name']
      end

      def long_name?
        name.length > 20
      end

      def first_name
        if data['name'].include?('Thanh')
          'Paul and Thanh'
        elsif data['name'].include?(' and ')
          names = data['name'].split('and ')
          names = names.map do |name|
            name.split(' ', 2).first
          end
          names.join(' and ')
        else
          data['name'].split(' ', 2).first
        end
      end

      def last_name
        data['name'].split(' ', 2).last
      end

      def avatar_filename(format: 'jpg')
        filename = name.downcase.gsub(' ', '-')
        "/2023/images/speakers/#{filename}.#{format}"
      end

      def bio
        markdown_to_html data['bio']
      end

      def pitch
        markdown_to_html data['pitch']
      end

      def has_twitter?
        !twitter.nil? && twitter.length > 0
      end

      def has_twitter2?
        !twitter2.nil? && twitter2.length > 0
      end

      def twitter
        data["twitter"] && data["twitter"].strip
      end

      def twitter2
        data["twitter2"] && data["twitter2"].strip
      end

      def has_mastodon?
        !mastodon.nil? && mastodon.length > 0
      end

      def mastodon
        data["mastodon"] && data["mastodon"].strip
      end

      def is_keynote?
        data["pitch"].strip.downcase == 'keynote' || data["pitch"].nil?
      end

      def compact_sponsor?
        !!data['compact_sponsor']
      end

      def has_video?
        !video.nil? && video.length > 0
      end

      def video
        data["video"]
      end

      def has_notes?
        !notes.nil? && notes.length > 0
      end

      def notes
        markdown_to_html data["notes"]
      end

      private

      attr_reader :data

      def markdown
        @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
      end

      def markdown_to_html(raw)
        return nil if raw.nil?

        markdown.render(raw).strip.html_safe
      end
    end
  end
end
