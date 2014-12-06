require_relative "../../spec_helper"
require "./lib/duolingo/wrapper"

describe Duolingo::Wrapper do
  let(:response) { Faraday.get("http://www.duolingo.com/users/Novohispano") }
  let(:wrapper) { described_class.new(response) }
  let(:language) do
    {
      "streak" => 0,
      "language_string" => "Portuguese",
      "language" => "pt",
      "level" => 10,
      "points" => 2285,
      "learning" => true,
      "current_learning" => true,
      "sentences_translated" => 0
    }
  end

  describe "#data" do
    it "parses json response" do
      VCR.use_cassette("user") do
        expect(wrapper.data).to eq JSON.parse(response.body)
      end
    end
  end

  describe "#languages" do
    it "returns all of them" do
      VCR.use_cassette("user") do
        expect(wrapper.languages).to include(language)
      end
    end
  end
end
