require_relative '../../spec_helper'
require './lib/duolingo/user'

describe "User" do
  it "can get the important data" do
    VCR.use_cassette('user') do
      username = "Novohispano"
      user = Duolingo::User.new(username)
      user.total_points
      expect(user.total_points).to eq(2285)
    end
  end
end
