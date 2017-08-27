module TwentySeventeen
  class Speaker
    attr_reader :name, :featured, :bio, :twitter, :avatar, :talk_title, :talk_datetime, :talk_track

    def initialize(name:, featured: false, bio: nil, twitter: nil, avatar: true, talk_title: nil, talk_datetime: nil, talk_track: nil)
      @name = name
      @featured = featured
      @bio = bio
      @twitter = twitter
      @avatar = avatar
      @talk_title = talk_title
      @talk_datetime = DateTime.parse(talk_datetime)
      @talk_track = talk_track
    end

    def main_track?
      self.talk_track.to_sym == :main
    end

    def tech_track?
      self.talk_track.to_sym == :tech
    end

    def slug
      name.downcase.gsub(/[^A-Za-z]/, '-')
    end

    def talk_time
      talk_datetime.strftime('%l:%M %p')
    end

    def epoch
      talk_datetime.strftime('%s')
    end

    def thursday
      talk_datetime.strftime('%A') == "Thursday"
    end

    def friday
      talk_datetime.strftime('%A') == "Friday"
    end

    def avatar_path
      avatar && "/images/2017/speakers/#{slug}.jpg" || "/images/2017/speakers/temp.png"
    end

    def external_url
      twitter && "https://twitter.com/#{twitter}" || '#'
    end
  end
end
