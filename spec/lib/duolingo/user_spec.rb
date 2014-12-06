require_relative "../../spec_helper"
require "./lib/duolingo/user"

describe Duolingo::User do
  let(:username) { "Novohispano" }
  let(:user) { described_class.new(username) }

  it "returns the  total points for all languages" do
    VCR.use_cassette("user") do
      expect(user.total_points).to eq(2285)
    end
  end

  it "all the studied languages" do
    VCR.use_cassette("user") do
      expect(user.languages_studied).to eq(["Portuguese"])
    end
  end

  it "languages that are currently being studied" do
    VCR.use_cassette("user") do
      expect(user.current_languages).to eq(["Portuguese"])
    end
  end

  it "points for a particular language" do
    VCR.use_cassette("user") do
      expect(user.points_for("Portuguese")).
        to eq("#{username} has 2285 points for Portuguese")
    end
  end

  it "gets number of followers" do
    VCR.use_cassette("user") do
      expect(user.number_of_followers).to eq(23)
    end
  end

  it "the date account was created" do
    VCR.use_cassette("user") do
      expect(user.created_at).to eq("9 months ago")
    end
  end

  it "number of people they are following" do
    VCR.use_cassette("user") do
      expect(user.num_following).to eq(47)
    end
  end

  it "has a full name" do
    VCR.use_cassette("user") do
      expect(user.full_name).to eq("Jorge Téllez")
    end
  end

  it "returns all the users information" do
    VCR.use_cassette("user") do
      expect(user.get_all_info).to include("Jorge Téllez")
    end
  end

  it "return a lot of info for that language" do
    VCR.use_cassette("user") do
      expect(user.stats_for_languages_studied.count).to eq 1
    end
  end

  it "returns all of the friends" do
    VCR.use_cassette("user") do
      expect(user.friends.count).to eq 47
    end
  end

  it "returns stats for all friends" do
    VCR.use_cassette("user") do
      expect(user.friends_stats).to include { "renechs" }
    end
  end

  it "returns the rank" do
    VCR.use_cassette("user") do
      expect(user.rank).to eq(3)
    end
  end
end
