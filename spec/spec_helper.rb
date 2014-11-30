require 'duolingo.rb'
require 'pry'
require 'vcr_setup'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
