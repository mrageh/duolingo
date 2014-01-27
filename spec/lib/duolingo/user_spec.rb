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

  it "points for a particular language" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.points_for("Portuguese")).to eq("#{username} has 2285 points for Portuguese")
    end
  end

  it "gets number of followers" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.number_of_followers).to eq(23)
    end
  end

  it "is not a admin" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.is_admin?).to be_false
    end
  end

  it "the date account was created" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.created_at).to eq("9 months ago")
    end
  end

  it "number of people they are following" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.num_following).to eq(47)
    end
  end

  it 'has a full name' do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.full_name).to eq("Jorge Téllez")
    end
  end

  it "returns the rank" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      expect(user.rank).to eq(3)
    end
  end
end
