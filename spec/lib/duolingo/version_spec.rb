require_relative "../../spec_helper"

describe Duolingo::VERSION do

  it "must be defined" do
    expect(Duolingo::VERSION).to_not be_nil
  end

end
