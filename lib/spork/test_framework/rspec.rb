class Spork::TestFramework::RSpec < Spork::TestFramework
  DEFAULT_PORT = 8989
  HELPER_FILE = File.join(Dir.pwd, "spec/spec_helper.rb")

  def run_tests(argv, stderr, stdout)
    options = ::RSpec::Core::ConfigurationOptions.new(argv)
    ::RSpec::Core::Runner.new(options).run(stderr, stdout)
  end

  def rspec3?
    return false if !defined?(::RSpec::Core::Version::STRING)
    ::RSpec::Core::Version::STRING =~ /^3\./
  end

  def rspec1?
    defined?(Spec) && !defined?(RSpec)
  end
end
