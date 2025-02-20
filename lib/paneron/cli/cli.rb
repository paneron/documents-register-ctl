# frozen_string_literal: true

require "thor"

module Paneron
  module Cli
    class Logger
      def initialize(options)
        @options = options
      end

      def debug(msg)
        puts msg if @options[:debug]
      end

      def verbose(msg)
        puts msg if @options[:verbose]
      end
    end
  end
end

# NOTE: This is for internal debugging.
def log(*args)
  return if ENV["DEBUG"].nil? || ENV["DEBUG"].empty?

  if block_given?
    warn yield
  else
    warn args
  end
end

module Paneron
  module Cli
    class Cli < Thor
      class_option :verbose, type: :boolean, aliases: "-v", desc: "Be verbose"
      class_option :debug, type: :boolean, aliases: "-d",
                           desc: "Enable debugging output"

      desc "init DIRECTORY", "Create a new register in DIRECTORY"
      def init(directory)
        Paneron::Cli::Command::Init.new(directory).run
      end

      desc "init-dataset DATASET_NAME",
           "Create a new dataset in current register directory"
      def init_dataset(directory)
        Paneron::Cli::Command::InitDataset.new(directory).run
      end

      desc "ls DATASET", "List item classes of a dataset"
      option :json, type: :boolean, aliases: "-j", desc: "Output as JSON"
      def ls(data_path, **)
        Paneron::Cli::Command::Ls.new(data_path, **).run
      end

      desc "ls-versions DATASET/ITEM_CLASS_ID", "Show versions of an item class"
      option :json, type: :boolean, aliases: "-j", desc: "Output as JSON"
      def ls_versions(data_path)
        Paneron::Cli::Command::LsVersions.new(data_path).run
      end

      desc "set KEY VALUE", "Set metadata KEY to VALUE"
      def set(key, value)
        Paneron::Cli::Command::Set.new(key, value).run
      end

      desc "get KEY", "Get metadata KEY"
      option :json, type: :boolean, aliases: "-j", desc: "Output as JSON"
      def get(key)
        Paneron::Cli::Command::Get.new(key).run
      end

      desc "set-add KEY VALUE", "Add VALUE to metadata KEY"
      define_method :"set-add" do |key, value|
        Paneron::Cli::Command::SetAdd.new(key, value).run
      end

      desc "upload DATASET/ITEM_CLASS_ID FILES...",
           "Upload files to an item class specified by ITEM_CLASS_ID in DATASET"
      option :force, type: :boolean, aliases: "-f",
                     desc: "Force upload / override version"
      option :dry_run, type: :boolean, aliases: "-d", desc: "Dry run"
      def upload(data_path, *files, **)
        Paneron::Cli::Command::Upload.new(data_path,
                                          *files, **).run
      end

      desc "rm DATASET/ITEM_CLASS_ID#VERSION_ID",
           "Remove an item class version (VERSION_ID)"
      option :force, type: :boolean, aliases: "-f", desc: "Force removal"
      option :dry_run, type: :boolean, aliases: "-d", desc: "Dry run"
      def rm(data_path)
        Paneron::Cli::Command::Rm.new(data_path).run
      end
    end
  end
end
