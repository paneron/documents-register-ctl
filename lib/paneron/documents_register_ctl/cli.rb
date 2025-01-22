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

def log(*args)
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
        log { "going to create a new register in #{directory}" }
      end

      desc "init-dataset DATASET_NAME",
           "Create a new dataset in current register directory"
      define_method :"init-dataset" do |directory|
        log { "going to create a new register in #{directory}" }
      end

      desc "ls DATASET", "Show contents of a dataset"
      def ls(data_path)
        log { "showing 'files' in #{data_path}" }
      end

      desc "ls-versions DATASET/DOC_ID", "Show versions of a document"
      define_method :"ls-versions" do |data_path|
        log { "showing versions of #{data_path}" }
      end

      desc "set KEY VALUE", "Set metadata KEY to VALUE"
      def set(key, value)
        log { "setting key value, #{key} => #{value}" }
      end

      desc "get KEY", "Get metadata KEY"
      def get(key)
        log { "getting metadata key, #{key}" }
      end

      desc "set-add KEY VALUE", "Add VALUE to metadata KEY"
      define_method :"set-add" do |key, value|
        log { "adding value to key, #{key} => #{value}" }
      end

      desc "upload DATASET/DOC_ID FILES...",
           "Upload files to a document specified by DOC_ID in DATASET"
      def upload(data_path, *files)
        log { "adding files to #{data_path}: #{files}" }
      end

      desc "rm DATASET/DOC_ID#VERSION_ID",
           "Remove a document version (VERSION_ID)"
      def rm(data_path)
        log { "going to remove in #{data_path}" }
      end
    end
  end
end
