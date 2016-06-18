$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'tty/file'

module Helpers
  def fixtures_path
    File.join(File.dirname(__FILE__), 'fixtures')
  end

  def tmp_path
    File.join(File.dirname(__FILE__), '../tmp')
  end
end

RSpec.configure do |config|
  config.include(Helpers)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Limits the available syntax to the non-monkey patched syntax that is recommended.
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 2

  config.order = :random

  Kernel.srand config.seed
end
