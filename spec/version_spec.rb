require_relative 'spec_helper'

describe Duolingo do

  it "must be defined" do
    (Duolingo::VERSION).should_not be_nil
  end

end
