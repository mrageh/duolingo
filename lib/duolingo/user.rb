module Duolingo
  class User
    attr_reader :response

    def initialize(username)
      @response = Faraday.get("http://www.duolingo.com/users/#{username}")
    end

    def total_points
      info = JSON.parse(response.body)
      info['languages'].inject(0) do |sum, lan|
        sum + lan["points"]
      end
    end
  end
end
