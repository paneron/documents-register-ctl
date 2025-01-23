# frozen_string_literal: true

require "paneron/register_ctl/version"
# require "paneron/register_ctl/error"

require "paneron/register_ctl/cli"
require "paneron/register_ctl/command"
require "paneron/register_ctl/command/init"
require "paneron/register_ctl/command/init_dataset"
require "paneron/register_ctl/command/ls"
require "paneron/register_ctl/command/ls_versions"
require "paneron/register_ctl/command/set"
require "paneron/register_ctl/command/set_add"
require "paneron/register_ctl/command/get"
require "paneron/register_ctl/command/upload"
require "paneron/register_ctl/command/rm"

module Paneron
  module RegisterCtl
  end
end
