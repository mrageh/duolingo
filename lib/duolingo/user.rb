require_relative "wrapper"

module Duolingo
  class User
    attr_reader :username, :all

    def initialize(username)
      @username = username
      @response = Faraday.get("http://www.duolingo.com/users/#{username}")
      @data = Duolingo::Wrapper.new(response)

      @all = data.data["language_data"]["pt"]["points_ranking_data"]
    end

    def total_points
      data.languages.inject(0) do |sum, lan|
        sum + lan["points"]
      end
    end

    def languages_studied
      data.languages.inject([]) do |languages, lan|
        languages << lan["language_string"] if lan["points"] > 0
        languages
      end
    end

    def current_languages
      data.languages.inject([]) do |languages, lan|
        languages << lan["language_string"] if lan["current_learning"]
        languages
      end
    end

    def points_for(language)
      points = data.languages.map do |lan|
        lan["points"] if lan["language_string"] == language.capitalize
      end.compact
      "#{username} has #{points.first} points for #{language}"
    end

    def number_of_followers
      data.data["num_followers"]
    end

    def admin?
      data.data["admin"]
    end

    def created_at
      data.data["created"].gsub("\n", "")
    end

    def num_following
      data.data["num_following"]
    end

    def full_name
      data.data["fullname"]
    end

    def get_all_info
      fields.map do |field|
        data.data[field]
      end
    end

    def stats_for_languages_studied
      data.languages.select do |lan|
        lan if lan["points"] > 0
      end
    end

    def friends
      all.select do |friend|
        friend unless friend["username"] == username.downcase
      end
    end

    def friends_stats
      friends.map do |friend|
        { username: friend["username"], points: friend["points_data"]["total"] }
      end
    end

    def rank
      all.detect do |user|
        user["username"] == username.downcase
      end["rank"]
    end

    private

    attr_reader :response, :data

    def fields
      [
        "username", "bio", "id", "num_following", "cohort",
        "num_followers", "learning_language_string", "created",
        "contribution_points", "gplus_id", "twitter_id", "admin",
        "invites_left", "location", "fullname", "avatar", "ui_language"
      ]
    end
  end
end
