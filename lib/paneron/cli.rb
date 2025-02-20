# frozen_string_literal: true

require_relative "cli/version"
# require_relative "cli/error"

require_relative "cli/cli"
require_relative "cli/command"
require_relative "cli/command/init"
require_relative "cli/command/init_dataset"
require_relative "cli/command/ls"
require_relative "cli/command/ls_versions"
require_relative "cli/command/set"
require_relative "cli/command/set_add"
require_relative "cli/command/get"
require_relative "cli/command/upload"
require_relative "cli/command/rm"

module Paneron
  module Cli
  end
end
