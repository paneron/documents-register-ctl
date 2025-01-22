# frozen_string_literal: true

module Paneron
  module DocumentsRegisterCtl
    module Command
      class Upload
        def initialize(data_path, *files)
          @data_path = data_path
          @files = files
        end

        def run
          log { "adding files to #{data_path}: #{files}" }
        end
      end
    end
  end
end
