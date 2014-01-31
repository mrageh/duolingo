module Duolingo
  class User
    attr_reader :response, :data, :username

    def initialize(username)
      @username = username
      @response = Faraday.get("http://www.duolingo.com/users/#{username}")
      @data = JSON.parse(response.body)
    end

    def total_points
      data['languages'].inject(0) do |sum, lan|
        sum + lan["points"]
      end
    end

    def languages_studied
      languages = []
      data['languages'].map do |lan|
        languages << lan["language_string"] if lan["points"] > 0
      end
      languages
    end

    def current_languages
      currently_studying = []
      data['languages'].map do |lan|
        currently_studying << lan['language_string'] if lan['current_learning']
      end
      currently_studying
    end

    def points_for(language)
      points = data['languages'].map do |lan|
        lan['points'] if lan['language_string'] == language.capitalize
      end.compact
      "#{username} has #{points.first} points for #{language}"
    end

    def number_of_followers
      data['num_followers']
    end

    def is_admin?
      data['admin']
    end

    def created_at
      data['created'].gsub("\n", "")
    end

    def num_following
      data['num_following']
    end

    def full_name
      data['fullname']
    end

    def get_all_info
      fields.map do |field|
        data[field]
      end
    end

    def stats_for_languages_studied
      data['languages'].select do |lan|
        lan if lan['points'] > 0
      end
    end

    def fields
      ['username','bio','id','num_following','cohort','num_followers', 'learning_language_string','created','contribution_points','gplus_id','twitter_id','admin','invites_left','location','fullname','avatar','ui_language']
    end

    def rank
      data['rank']
    end
  end
end
