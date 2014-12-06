module Duolingo
  class Wrapper
    attr_reader :data

    def initialize(response)
      @data = JSON.parse(response.body)
    end

    def languages
      data["languages"]
    end
  end
end
