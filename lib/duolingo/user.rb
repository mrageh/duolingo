module Duolingo
  class User
    attr_reader :response, :data

    def initialize(username)
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

  end
end
