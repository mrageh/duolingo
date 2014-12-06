require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "cassettes"
  c.hook_into :webmock
end
