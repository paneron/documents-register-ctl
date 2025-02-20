# frozen_string_literal: true

require "paneron/cli/version"
# require "paneron/cli/error"

require "paneron/cli/cli"
require "paneron/cli/command"
require "paneron/cli/command/init"
require "paneron/cli/command/init_dataset"
require "paneron/cli/command/ls"
require "paneron/cli/command/ls_versions"
require "paneron/cli/command/set"
require "paneron/cli/command/set_add"
require "paneron/cli/command/get"
require "paneron/cli/command/upload"
require "paneron/cli/command/rm"

module Paneron
  module Cli
  end
end
