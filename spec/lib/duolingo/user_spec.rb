require_relative '../../spec_helper'
require './lib/duolingo/user'

describe "User" do
  it "returns the  total points for all languages" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.total_points).to eq(2285)
    end
  end

  it "all the studied languages" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.languages_studied).to eq(["Portuguese"])
    end
  end

  it "languages that are currently being studied" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.current_languages).to eq(['Portuguese'])
    end
  end
end
