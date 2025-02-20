require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
end

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "bundler/setup"
require "rspec-command"
require "paneron/cli"
require "fileutils"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.include Paneron::ConsoleHelper
  config.include Paneron::HomeHelper

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    tmp_dir = Pathname.new(Dir.tmpdir)
    FileUtils.mkdir_p(tmp_dir) unless tmp_dir.exist?

    # Disable http authentication
    ENV["GIT_TERMINAL_PROMPT"] = "0"
  end

  config.before(:each) do
    @tmp_dir = Pathname.new(Dir.tmpdir)
  end

  config.after(:suite) do
    ENV["GIT_TERMINAL_PROMPT"] = "1"
  end

  config.include RSpecCommand
end
