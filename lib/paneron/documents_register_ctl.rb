# frozen_string_literal: true

require "paneron/documents_register_ctl/version"
# require "paneron/documents_register_ctl/error"

require "paneron/documents_register_ctl/cli"
require "paneron/documents_register_ctl/command"
require "paneron/documents_register_ctl/command/init"
require "paneron/documents_register_ctl/command/init_dataset"
require "paneron/documents_register_ctl/command/ls"
require "paneron/documents_register_ctl/command/ls_versions"
require "paneron/documents_register_ctl/command/set"
require "paneron/documents_register_ctl/command/set_add"
require "paneron/documents_register_ctl/command/get"
require "paneron/documents_register_ctl/command/upload"
require "paneron/documents_register_ctl/command/rm"

module Paneron
  module DocumentsRegisterCtl
  end
end
