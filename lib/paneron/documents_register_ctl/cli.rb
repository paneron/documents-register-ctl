# frozen_string_literal: true

require "thor"

module Paneron
  module DocumentsRegisterCtl
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
  module DocumentsRegisterCtl
    class CLI < Thor
      class_option :verbose, type: :boolean, aliases: "-v", desc: "Be verbose"
      class_option :debug, type: :boolean, aliases: "-d",
                           desc: "Enable debugging output"

      desc "init DIRECTORY", "Create a new register in DIRECTORY"
      def init(directory)
        Paneron::DocumentsRegisterCtl::Command::Init.new(directory).run
      end

      desc "init-dataset DATASET_NAME",
           "Create a new dataset in current register directory"
      def init_dataset(directory)
        Paneron::DocumentsRegisterCtl::Command::InitDataset.new(directory).run
      end

      desc "ls DATASET", "Show contents of a dataset"
      def ls(data_path)
        Paneron::DocumentsRegisterCtl::Command::Ls.new(data_path).run
      end

      desc "ls-versions DATASET/DOC_ID", "Show versions of a document"
      def ls_versions(data_path)
        Paneron::DocumentsRegisterCtl::Command::LsVersions.new(data_path).run
      end

      desc "set KEY VALUE", "Set metadata KEY to VALUE"
      def set(key, value)
        Paneron::DocumentsRegisterCtl::Command::Set.new(key, value).run
      end

      desc "get KEY", "Get metadata KEY"
      def get(key)
        Paneron::DocumentsRegisterCtl::Command::Get.new(key).run
      end

      desc "set-add KEY VALUE", "Add VALUE to metadata KEY"
      define_method :"set-add" do |key, value|
        Paneron::DocumentsRegisterCtl::Command::SetAdd.new(key, value).run
      end

      desc "upload DATASET/DOC_ID FILES...",
           "Upload files to a document specified by DOC_ID in DATASET"
      def upload(data_path, *files)
        Paneron::DocumentsRegisterCtl::Command::Upload.new(data_path,
                                                           *files).run
      end

      desc "rm DATASET/DOC_ID#VERSION_ID",
           "Remove a document version (VERSION_ID)"
      def rm(data_path)
        Paneron::DocumentsRegisterCtl::Command::Rm.new(data_path).run
      end
    end
  end
end
